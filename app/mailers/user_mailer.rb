class UserMailer < ActionMailer::Base
  # set some sensible defaults
  default :from => MyApp::Application.config.postmark_signature

  # send a receipt of the Member's purchase
  def receipt_message(order)
    @order = order
    @billing_address = order.convert_billing_address_to_hash(order.billing_address)

    mail(:to => @order.user.email, :subject => "Your Order Receipt", :tag => 'order-receipt', :content_type => "text/html") do |format|
      format.html
    end
  end

  # send password reset instructions
  def reset_password_instructions(user)
     @resource = user
     mail(:to => @resource.email, :subject => "Reset password instructions", :tag => 'password-reset', :content_type => "text/html") do |format|
       format.html { render "devise/mailer/reset_password_instructions" }
     end
   end
end