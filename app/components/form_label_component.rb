# frozen_string_literal: true

class FormLabelComponent < ApplicationComponent
  CLASS = "block"
  CONTENT_CLASS = "text-gray-700"

  def initialize(form, *args, **options)
    @form = form
    @args = args
    @options = { class: CLASS }.merge(options)

    @content_options = { class: CONTENT_CLASS }
  end

  def render?
    content?
  end
end
