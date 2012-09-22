class UserMailer < ActionMailer::Base
  default from: "alwaysfindingthetruth@gmail.com"

  def payment_reminder(email, price)
    @price = price     
    mail(:to => email, :subject => "Remember to pay for mealpay!")
  end

end
