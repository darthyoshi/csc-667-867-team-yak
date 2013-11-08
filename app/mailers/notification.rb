class Notification < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.new_review.subject
  # You never call the Notification#welcome method directly. In fact, 
  # Notification#welcome is not even available, since it's an instance method, 
  # and you never instantiate a Notification object directly.
  def new_review
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  
  # Just an example
  def welcome(user, sent_at=Time.now)
	  @subject = 'A Friendly Welcome'
    @recipients = user.email
    @from = 'admin@mysite.com'
    @sent_on = sent_at
    # mailer views do not have access to the instance variables of the mailer. 
    # To set instance variables for mailers, you pass a hash of those variables 
    # to the body method. 
    @body = {
      :user => user,
      :sent_on => sent_at
    }
    # To send the welcome email from your Rails application, add the following 
    # code to either a controller, a model:
    # Notification.deliver_welcome(user)
	end
  
  
end
