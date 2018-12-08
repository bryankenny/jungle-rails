class UserMailer < ActionMailer::Base
  default from: 'no-reply@jungle.com'

  def order_confirmation(user, order)
    @user = user
    @order = order
    mail(to: user, subject: 'Order has been received')

  end
end