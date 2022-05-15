# frozen_string_literal: true

class ButtonLinkComponent < ApplicationComponent
  CLASS = "
    inline-block
    cursor-pointer
    rounded
    py-2
    px-4
    normal-case
    font-bold
    focus:ring-2
  "
  DEFAULT_SCHEME = :primary
  SCHEME_CLASS = {
    primary:   "text-white      bg-blue-500   hover:bg-blue-700   focus:ring-blue-300",
    secondary: "text-gray-600   bg-gray-200   hover:bg-gray-300   focus:ring-gray-400",
    info:      "text-gray-600   bg-gray-200   hover:bg-gray-300   focus:ring-gray-400",
    danger:    "text-red-600    bg-red-200    hover:bg-red-300    focus:ring-red-400",
    warning:   "text-orange-600 bg-orange-200 hover:bg-orange-300 focus:ring-orange-400",
    success:   "text-green-600  bg-green-200  hover:bg-green-300  focus:ring-green-400",
  }

  def initialize(scheme: DEFAULT_SCHEME, href: "", **options)
    @scheme = scheme
    @href = href

    @options = {
      class: token_list(
        CLASS,
        SCHEME_CLASS.fetch(@scheme, SCHEME_CLASS[DEFAULT_SCHEME])
      ),
      role: "button",
      rel: options[:target] == "_blank" ? "noopener noreferrer" : nil
    }.merge(options)
  end

  def render?
    @href.present? && content?
  end
end
