class ContactController < ApplicationController
  respond_to :json

  # TODO: remove
  def new
    @form_action = request.path
    @form_id = @form_action.sub("_us", "_request").split("/").last << "_form"
  end

  def join_request
    contact_us Contact::JoinRequest.new(params) do |form|
      ContactMailer.join_request(form).deliver
    end
  end

  def hire_request
    contact_us Contact::HireRequest.new(params) do |form|
      ContactMailer.hire_request(form).deliver
    end
  end

  def send_message
    contact_us Contact::SendMessage.new(params) do |form|
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
