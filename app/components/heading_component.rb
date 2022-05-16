# frozen_string_literal: true

class HeadingComponent < ApplicationComponent
  TAGS = [:h1, :h2, :h3, :h4, :h5, :h6]
  FALLBACK_TAG = :h2

  CLASS = {
    h1: 'font-bold text-4xl',
    h2: 'font-bold text-2xl',
  }

  def initialize(tag:, **options)
    @tag = TAGS.include?(tag) ? tag : FALLBACK_TAG
    @options = { class: CLASS.fetch(tag) }.merge(options)
  end

  def render?
    content?
  end
end
