# frozen_string_literal: true

class ButtonLinkComponent < ApplicationComponent
  DEFAULT_SCHEME = :primary
  SCHEME_CLASS = {
    primary:   'btn btn-primary',
    secondary: 'btn btn-secondary',
    info:      'btn btn-info',
    danger:    'btn btn-danger',
    warning:   'btn btn-warning',
    success:   'btn btn-success',
  }

  def initialize(scheme: DEFAULT_SCHEME, href: "", **options)
    @scheme = scheme
    @href = href

    @options = {
      class: SCHEME_CLASS.fetch(@scheme, SCHEME_CLASS[DEFAULT_SCHEME]),
      role: "button",
      rel: options[:target] == "_blank" ? "noopener noreferrer" : nil
    }.merge(options)
  end

  def render?
    @href.present? && content?
  end
end
