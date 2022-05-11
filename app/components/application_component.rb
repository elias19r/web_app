class ApplicationComponent < ViewComponent::Base
  def content?
    content.present?
  end
end
