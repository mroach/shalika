class Contact::EnquiriesController < ApplicationController

  def new
    @enquiry = Contact::Enquiry.new
  end

  def create
    @enquiry = Contact::Enquiry.new(enquiry_params)

    if @enquiry.save
      logger.debug @enquiry.inspect
      Contact::EnquiryMailer.enquiry_email(@enquiry).deliver
      redirect_to cms_show_page_path("contact"), notice: "Thank you! We'll be in touch soon."
    else
      redirect_to cms_show_page_path("contact")
    end
  end

  private

  def enquiry_params
    params.require(:contact_enquiry).permit(:name, :email, :phone, :message, :seen)
  end

end
