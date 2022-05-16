# frozen_string_literal: true

class FormPasswordFieldComponent < ApplicationComponent
  CLASS = "
    mt-1
    block
    w-full
    rounded-md
    border-gray-300
    shadow-sm
    focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50
  "

  def initialize(form, *args, **options)
    @form = form
    @args = args
    @options = { class: CLASS }.merge(options)
  end
end
