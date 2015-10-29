module MnoEnterprise
  class Jpi::V1::CurrentUsersController < ApplicationController
    before_filter :authenticate_user!, only: [:update, :update_password]
    respond_to :json

    # GET /mnoe/jpi/v1/current_user
    def show
      @user = current_user || User.new
    end
    
    # PUT /mnoe/jpi/v1/current_user
    def update
      @user = current_user
      
      if @user.update(user_params)
        render 'show'
      else
        render json: @user.errors, status: :bad_request
      end
    end
    
    # PUT /mnoe/jpi/v1/current_user/update_password
    def update_password
      @user = current_user
      
      if @user.update(password_params)
        sign_in @user, bypass: true
        render 'show'
      else
        render json: @user.errors, status: :bad_request
      end
    end
    
    private
      def user_params
        params.require(:user).permit(:name, :surname, :email, :company, :settings, :phone, :website, :phone_country_code, :current_password, :password, :password_confirmation)
      end
      
      def password_params
        params.require(:user).permit(:current_password, :password, :password_confirmation)
      end
  end
end
