# frozen_string_literal: true

class FlashComponent < ApplicationComponent
  def initialize(flash)
    @flash = flash
  end

  def render?
    @flash.any?
  end

  private

  def build_alert_kwargs(flash_item)
    key, value = flash_item

    case value
    when Hash
      {
        scheme: key,
        subject: value[:subject],
        dismissible: value[:dismissible],
        **(value[:options] || {})
      }.compact
    else
      {
        scheme: key
      }
    end
  end

  def get_alert_content(flash_item)
    _key, value = flash_item

    case value
    when Hash then
      value[:content]
    else
      value
    end
  end

  def build_alert_button_link_kwargs(flash_item)
    _key, value = flash_item

    case value
    when Hash
      button_link = value[:button_link] || {}

      {
        href: button_link[:href],
        **(button_link[:options] || {})
      }.compact
    else
      {}
    end
  end

  def get_alert_button_link_content(flash_item)
    _key, value = flash_item

    case value
    when Hash
      button_link = value[:button_link] || {}

      button_link[:content]
    else
      nil
    end
  end
end
