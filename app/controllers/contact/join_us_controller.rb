class Contact::JoinUsController < ApplicationController
  respond_to :json

  def new
  end

  def create
    # TODO: use form object
    message = OpenStruct.new message_params
    visitor = OpenStruct.new visitor_params
    ContactMailer.join_us_request(message, from: visitor).deliver
    head :accepted
  end

  private
  def message_params
    params.require(:message).permit(:title, :content)
  end

  def visitor_params
    params.require(:visitor).permit(:name, :email)
  end
end
