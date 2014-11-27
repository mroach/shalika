class Contact::EnquiryMailer < ActionMailer::Base
  default from: "web@internet.com",
          to: "mroach@mroach.com",
          subject: "Message from the website!"

  def enquiry_email(enquiry)
    @enquiry = enquiry
    mail
  end
end
