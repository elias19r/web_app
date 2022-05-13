# frozen_string_literal: true

class AlertComponent < ApplicationComponent
  DEFAULT_SCHEME = "info"

  ALERT_CLASS = {
    "info"    => "text-gray-700   bg-gray-100   border-gray-500",
    "danger"  => "text-red-700    bg-red-100    border-red-500",
    "warning" => "text-orange-700 bg-orange-100 border-orange-500",
    "success" => "text-green-700  bg-green-100  border-green-500",
  }
  BUTTON_DISMISS_CLASS = {
    "info"    => "text-gray-500   bg-gray-100   hover:bg-gray-200   focus:ring-gray-400",
    "danger"  => "text-red-500    bg-red-100    hover:bg-red-200    focus:ring-red-400",
    "warning" => "text-orange-500 bg-orange-100 hover:bg-orange-200 focus:ring-orange-400",
    "success" => "text-green-500  bg-green-100  hover:bg-green-200  focus:ring-green-400",
  }

  renders_one :button_link, ->(href: "", **options) do
    ButtonLinkComponent.new(scheme: @scheme, href:, **options)
  end

  def initialize(scheme: DEFAULT_SCHEME, subject: "", dismissible: true, **options)
    @scheme = scheme
    @subject = subject
    @dismissible = dismissible

    @options = {
      data: { controller: "alert" },
      role: "alert",
      class: token_list(
        "border-l-4 p-4 flex flex-row w-full max-w-screen-lg",
        ALERT_CLASS.fetch(@scheme, ALERT_CLASS[DEFAULT_SCHEME])
      )
    }.merge(options)

    @button_dismiss_options = {
      data: { action: "click->alert#close" },
      type: "button",
      aria: { label: I18n.t("components.alert.close") },
      class: token_list(
        "inline-flex ml-auto -mx-1.5 -my-1.5 p-1.5 h-8 w-8 rounded-lg focus:ring-2",
        BUTTON_DISMISS_CLASS.fetch(@scheme, BUTTON_DISMISS_CLASS[DEFAULT_SCHEME])
      )
    }
  end

  def render?
    @subject.present? || content?
  end
end
