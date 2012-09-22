ActionMailer::Base.smtp_settings = { 
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "kickthelist.com:3000",
  :user_name            => "alwaysfindingthetruth@gmail.com",
  :password             => "alwaysfindingthetruth",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "kickthelist.com:3000"

