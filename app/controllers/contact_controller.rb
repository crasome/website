class ContactController < ApplicationController
  respond_to :json

  def join_us
    contact_us Contact::JoinUsForm.new(params) do |form|
      ContactMailer.join_us_request(form).deliver
    end
  end

  def hire_us
    contact_us Contact::HireUsForm.new(params) do |form|
      ContactMailer.hire_us_request(form).deliver
    end
  end

  def send_message
    contact_us Contact::SendMessageForm.new(params) do |form|
      ContactMailer.send_message(form).deliver
    end
  end

  private
  def contact_us(form)
    form.validate!
    yield form if block_given?
    render json: form, status: :created

  rescue ValidationError
    render json: $!.errors, status: :bad_request
  end
end
