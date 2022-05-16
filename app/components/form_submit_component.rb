# frozen_string_literal: true

class FormSubmitComponent < ApplicationComponent
  CLASS = "
    inline-block
    cursor-pointer
    rounded
    py-2
    px-4
    normal-case
    font-bold
    focus:ring-2
    text-white
    bg-blue-500
    hover:bg-blue-700
    focus:ring-blue-300
  "

  def initialize(form, *args, **options)
    @form = form
    @args = args
    @options = { class: CLASS }.merge(options)
  end
end
