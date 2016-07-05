class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user.password == params[:current_password]
      if @user.update(password_change_params)
        # Sign in the user by passing validation in case their password changed
        sign_in @user, :bypass => true
        redirect_to root_path
      else
        redirect_to edit_user_registration_path
      end
    end
  end

  def update_profile
    @user = current_user
    if @user.update_without_password(profile_change_params)
        redirect_to root_path
      else
        redirect_to edit_user_registration_path
    end
  end

  def update_email
    @user = current_user
    if @user.update(email_change_params)
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      redirect_to edit_user_registration_path
    end
  end

  private

  def password_change_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(
    :password, 
    :password_confirmation
    )
  end
  
  def profile_change_params
    params.require(:user).permit(
    :name, 
    :surname,
    :birthday
    )
  end
  
  def email_change_params
    params.require(:user).permit(
    :password, 
    :email
    )
  end
end