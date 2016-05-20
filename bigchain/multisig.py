import copy
import json

import cryptoconditions as cc
from bigchaindb import util, crypto

signature_treshold = 1
# signature_treshold = 2

# Create some new testusers
thresholduser1_priv, thresholduser1_pub = crypto.generate_key_pair()
thresholduser2_priv, thresholduser2_pub = crypto.generate_key_pair()

# Retrieve the last transaction of testuser2
tx_retrieved_id = b.get_owned_ids(testuser2_pub).pop()

# Create a base template for a 1-input/2-output transaction
threshold_tx = b.create_transaction(testuser2_pub, [thresholduser1_pub, thresholduser2_pub], tx_retrieved_id, 'TRANSFER')

# Create a Threshold Cryptocondition
threshold_condition = cc.ThresholdSha256Fulfillment(threshold=signature_treshold)
threshold_condition.add_subfulfillment(cc.Ed25519Fulfillment(public_key=thresholduser1_pub))
threshold_condition.add_subfulfillment(cc.Ed25519Fulfillment(public_key=thresholduser2_pub))

# Update the condition in the newly created transaction
threshold_tx['transaction']['conditions'][0]['condition'] = {
    'details': json.loads(threshold_condition.serialize_json()),
    'uri': threshold_condition.condition.serialize_uri()
}

# Conditions have been updated, so the transaction hash (ID) needs updating
threshold_tx['id'] = util.get_hash_data(threshold_tx)

# Sign the transaction
threshold_tx_signed = b.sign_transaction(threshold_tx, testuser2_priv)

# Write the transaction
b.write_transaction(threshold_tx_signed)


sleep(0.2)

# Check if the transaction is already in the bigchain
tx_threshold_retrieved = b.get_transaction(threshold_tx_signed['id'])
tx_threshold_retrieved
