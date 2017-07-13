class OrderConfirmationMailer < ApplicationMailer

  def send_order_confirmation(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'thanks for your order')

  end
end
