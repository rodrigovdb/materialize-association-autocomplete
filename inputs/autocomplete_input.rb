# frozen_string_literal: true

class AutocompleteInput < SimpleForm::Inputs::FileInput
  def input(_wrapper_options = nil)
    out = ActiveSupport::SafeBuffer.new

    out << hidden_field

    out << autocomplete_field.html_safe
    out << autocomplete_js.html_safe
  end

  private

  def autocomplete_hidden_field_id
    hidden_field.scan(%r{id="(.+)" /}).flatten.first
  end

  def hidden_field
    @hidden_field ||= @builder.hidden_field("#{attribute_name}_id").html_safe
  end

  def autocomplete_field
    "<input type=\"text\" id=\"#{autocomplete_field_id}\" class=\"autocomplete\" autocomplete=\"off\" value=\"#{autocomplete_field_value}\">"
  end

  def autocomplete_field_id
    "#{attribute_name}_name"
  end

  def autocomplete_field_value
    object.send(attribute_name)&.name
  end

  def autocomplete_js
    <<-JS
      <script>
        var items_#{attribute_name} = #{autocomplete_data.to_json}
        $(document).ready(function(){
          $('input##{autocomplete_field_id}').autocomplete({
            data: #{autocomplete_data.to_json},
            onAutocomplete: function(option){
              $('##{autocomplete_hidden_field_id}').val(items_#{attribute_name}[option])
            }
          });
        });
      </script>
    JS
  end

  def autocomplete_data
    @autocomplete_data ||= fetch_autocomplete_data
  end

  def fetch_autocomplete_data
    klass = attribute_name.to_s.camelize.constantize

    klass.all.order(:name).each_with_object({}) do |i, r|
      r[i.name] = i.id
    end
  end
end
