# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.error_notification_class = nil
  config.button_class = nil
  config.boolean_label_class = nil

  config.wrappers :vertical_form, tag: "div", class: "input", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "control-label"

    b.use :input, wrap_with: { tag: "div", class: "input-wrap" }
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint,  wrap_with: { tag: "small" }
  end

  config.wrappers :vertical_file_input, tag: "div", class: "input", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label, class: "control-label"

    b.use :input
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint,  wrap_with: { tag: "small" }
  end

  config.wrappers :vertical_boolean, tag: "div", class: "input", error_class: "has-error" do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: "div", class: "checkbox" do |ba|
      ba.use :label_input
    end

    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint,  wrap_with: { tag: "small" }
  end

  config.wrappers :vertical_radio_and_checkboxes, tag: "div", class: "input", error_class: "has-error" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "control-label"
    b.use :hint,  wrap_with: { tag: "small" }
    b.use :input
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
  end

  config.wrappers :horizontal_form, tag: "div", class: "input horizontal", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "control-label"

    b.wrapper tag: "div", class: "input-wrap" do |ba|
      ba.use :input, wrap_with: { tag: "div" }
      ba.use :hint,  wrap_with: { tag: "small" }
      ba.use :error, wrap_with: { tag: "span", class: "help-block" }
    end
  end

  config.wrappers :horizontal_file_input, tag: "div", class: "input", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label, class: "col-sm-3 control-label"

    b.wrapper tag: "div", class: "col-sm-9" do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: "span", class: "help-block" }
      ba.use :hint,  wrap_with: { tag: "small" }
    end
  end

  config.wrappers :horizontal_boolean, tag: "div", class: "form-check-inline", error_class: "has-error" do |b|
    b.use :html5
    b.optional :readonly

    b.use :label_input

    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint,  wrap_with: { tag: "small" }
  end

  config.wrappers :horizontal_radio_and_checkboxes, tag: "div", class: "input horizontal", error_class: "has-error" do |b|
    b.use :html5
    b.optional :readonly

    b.use :label

    b.wrapper tag: "div" do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: "span", class: "help-block" }
      ba.use :hint,  wrap_with: { tag: "small" }
    end
  end

  config.wrappers :inline_form, tag: "div", class: "input", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "sr-only"

    b.use :input
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint,  wrap_with: { tag: "small" }
  end

  config.wrappers :multi_select, tag: "div", class: "input", error_class: "has-error" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label
    b.wrapper tag: "div" do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: "span", class: "help-block" }
      ba.use :hint,  wrap_with: { tag: "small" }
    end
  end
  # Wrappers for forms and inputs using the Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :vertical_form
  config.wrapper_mappings = {
    check_boxes: :vertical_radio_and_checkboxes,
    radio_buttons: :vertical_radio_and_checkboxes,
    file: :vertical_file_input,
    boolean: :vertical_boolean,
    datetime: :multi_select,
    date: :multi_select,
    time: :multi_select
  }
end
