class WizardFormBuilder < ActionView::Helpers::FormBuilder

  def wizard_sections
    self.object.class.section_types.collect do |section|
      radio_button_group(section)
    end.join("\n")
  end
  
  # options = { }
  def radio_button_group(attribute, options = {})
    choices = self.object.class.send("#{attribute}_options")
    content_tag(:div, :class => "section #{attribute.to_s.pluralize}") do
      html = choices.collect { |radio_choice| radio_button_choice(attribute, radio_choice) }.join("\n")
      # html << content_tag(:div, link_to('Continue Customizing', '#next', :class => 'next-section-link'), :class => 'actions')
    end
  end
  
  def radio_button_choice(attribute, choice)
    choice_value = choice['name'].underscore.downcase
    label_data = content_tag(:span, choice['name'], :class => 'option-name')
    label_data << content_tag(:span, "[costs #{number_to_currency(choice['price'])}]", :class => 'option-price')
    content_tag(:div, :class => "choice #{attribute}") do
      html = self.radio_button(attribute, choice_value)
      html << self.label(attribute, label_data)
    end
  end
  
  def section_navigation_links
    content_tag(:ul, :class => 'navigation') do
      self.object.class.section_types.collect do |section|
        caption = image_tag("sections/#{section}.gif") + "<br/>" + section.titleize
        link = link_to(caption, "##{section}", :class => "section-link", :rel => section.pluralize)
        content_tag(:li, link, :class => "#{section.pluralize}-nav")
      end.join("\n")
    end
  end
  

  protected

    def method_missing(*args, &block)
      @template.send(*args, &block)
    end

end
