class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :username, :first_name, :last_name, :phone_number, :photo)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :username, :first_name, :last_name, :phone_number, :photo)
  end
end
