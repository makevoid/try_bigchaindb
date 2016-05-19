module UILib
  include Haml::Helpers

  alias :c :haml_concat

  # %label.icon 🔑
  # %input{ type: "text", disabled: true, value: text }
  #
  def key_label(text)
    haml_tag :label, class: "icon" do
      c "🔑"
    end
    haml_tag :input, type: "text", disabled: true, value: text
  end

  def qs
    "document.querySelector"
  end

  def toggler(name)
    "
    #{qs}('.toggle_#{name}').style.display = 'block';
    this.style.display = 'none';
    ".strip
  end

end
