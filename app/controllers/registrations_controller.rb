class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(registration_params)
    if @user.save
      login(registration_params[:email], registration_params[:password])
      redirect_to root_path, notice: I18n.t('controllers.registration.created')
    else
      render :new
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:email, :password, :password_confirmation)
  end
end
