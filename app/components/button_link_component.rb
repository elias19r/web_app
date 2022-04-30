# frozen_string_literal: true

class ButtonLinkComponent < ViewComponent::Base
  def initialize(text:, href:)
    @text = text
    @href = href
  end
end
