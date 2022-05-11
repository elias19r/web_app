# frozen_string_literal: true

class ButtonLinkComponent < ApplicationComponent
  BUTTON_CLASS = "
    bg-blue-500
    hover:bg-blue-700
    text-white
    font-bold
    py-2
    px-4
    rounded
  "
  def initialize(href:, **options)
    @href = href
    @options = { class: BUTTON_CLASS }.merge(options)
  end

  def render?
    content?
  end
end
