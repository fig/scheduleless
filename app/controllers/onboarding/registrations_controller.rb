module Onboarding
  class RegistrationsController < ApplicationController
    layout "onboarding"

    before_action :redirect_if_logged_in?

    def new
      @registration = Registration.new(new_registration_params)
    end

    def create
      @registration = Registration.new(registration_params.merge(request: request))

      if @registration.valid? && @registration.register
        sign_in(@registration.user)
      else
        render :new
      end
    end

    private

    def redirect_if_logged_in?
      if current_login_user.present?
        redirect_to new_onboarding_position_path and return
      end
    end

    def new_registration_params
      {
        email: params[:email],
        plan_id: selected_plan_id
      }
    end

    def selected_plan_id
      begin
        Plan.where("lower(plan_name) = ?", params[:tier].downcase).first.id
      rescue
        Plan.find_by(default: true).id
      end
    rescue
      nil
    end

    def registration_params
      params.
        require(:registration).
        permit(
          :company_name,
          :email,
          :first_name,
          :last_name,
          :password,
          :password_confirmation,
          :plan_id
        )
    end
  end
end
