require "contact/join_us_form"

module Contact
  class JoinUsController < ApplicationController
    respond_to :json

    def new
    end

    def create
      JoinUsForm.new(params).tap do |contact_form|
        contact_form.validate!

        ContactMailer.join_us_request(contact_form).deliver
        render json: contact_form, status: :created
      end
    rescue ValidationError
      render json: $!.errors, status: :bad_request
    end
  end
end
