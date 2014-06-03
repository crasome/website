class TheCompanyPresenter
  def name
    ENV['COMPANY_NAME']
  end

  def slogan
    ENV['COMPANY_SLOGAN'].split
  end

  def contact_email
    "#{ENV['EMAIL_GROUP_TO_MESSAGE']}@#{ENV['COMPANY_DOMAIN']}"
  end
end
