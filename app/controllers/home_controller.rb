class HomeController < ApplicationController
  def index
    # Testing
    flash[:notice]  = { subject: 'Subject here', content: 'Some notice message' , dismissible: true, button_link: { content: "I'm button", href: '/example' } }
    flash[:info]    = { subject: 'Subject here', content: 'Some info message'   , dismissible: true, button_link: { content: "I'm button", href: '/example' } }
    flash[:error]   = { subject: 'Subject here', content: 'Some error message'  , dismissible: true, button_link: { content: "I'm button", href: '/example' } }
    flash[:warning] = { subject: 'Subject here', content: 'Some warning message', dismissible: true, button_link: { content: "I'm button", href: '/example' } }
    flash[:success] = { subject: 'Subject here', content: 'Some success message', dismissible: true, button_link: { content: "I'm button", href: '/example' } }
  end
end
