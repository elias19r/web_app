# frozen_string_literal: true

module Users
  class ErrorMessagesComponent < ApplicationComponent
    def initialize(resource:)
      @resource = resource
    end

    def render?
      @resource.errors.any?
    end

    private

    def alert_subject
      I18n.t(
        "errors.messages.not_saved",
        count: @resource.errors.count,
        resource: @resource.class.model_name.human.downcase
      )
    end
  end
end
