class HomeController < ApplicationController
  def index
    # Testing
    flash[:info] = {
      subject: 'Subject here',
      content: 'Some info message',
      dismissible: true,
      button_link: { content: "I'm button", href: '#' }
    }
    flash[:danger] = {
      subject: 'Subject here',
      content: 'Some danger message',
      dismissible: true
    }
    flash[:warning] = {
      subject: 'Subject here',
      content: 'Some warning message',
      dismissible: true,
      button_link: { content: "I'm button", href: '#' }
    }

    flash[:success] = 'Some success message'
  end
end
