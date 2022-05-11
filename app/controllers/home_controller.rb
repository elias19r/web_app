class HomeController < ApplicationController
  def index
    # Testing
    flash[:info]    = { subject: 'Subject here', content: 'Some info message',    dismissible: true, button_link: { content: "I'm button", href: '/example' } }
    flash[:danger]  = { subject: 'Subject here', content: 'Some danger message',  dismissible: true, button_link: { content: "I'm button", href: '/example' } }
    flash[:warning] = { subject: 'Subject here', content: 'Some warning message', dismissible: true, button_link: { content: "I'm button", href: '/example' } }

    flash[:success] = 'Some success message'
  end
end
