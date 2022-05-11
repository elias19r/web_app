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
  BUTTON_LINK_CLASS = {
    "info"    => "font-bold py-2 px-4 rounded text-gray-600   bg-gray-200   hover:bg-gray-300   focus:ring-gray-400",
    "danger"  => "font-bold py-2 px-4 rounded text-red-600    bg-red-200    hover:bg-red-300    focus:ring-red-400",
    "warning" => "font-bold py-2 px-4 rounded text-orange-600 bg-orange-200 hover:bg-orange-300 focus:ring-orange-400",
    "success" => "font-bold py-2 px-4 rounded text-green-600  bg-green-200  hover:bg-green-300  focus:ring-green-400",
  }

  renders_one :button_link, -> (href:) do
    button_link_options = {
      class: BUTTON_LINK_CLASS.fetch(@scheme, BUTTON_LINK_CLASS[DEFAULT_SCHEME])
    }

    ButtonLinkComponent.new(href: href, **button_link_options)
  end

  def initialize(scheme: DEFAULT_SCHEME, subject: "", dismissible: true, **options)
    @scheme = scheme
    @subject = subject
    @dismissible = dismissible
    @options = {
      role: "alert",
      class: token_list("border-l-4 p-4", ALERT_CLASS.fetch(@scheme, ALERT_CLASS[DEFAULT_SCHEME])),
      data: { controller: "alert" },
    }.merge(options)

    @button_dismiss_options = {
      aria: { label: "Close" },
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
