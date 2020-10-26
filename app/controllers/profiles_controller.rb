class ProfilesController < ApplicationController
  
  def show
    @user = current_user
    @profile = @user.profile
  end

  private

  def profile_params
    params.require(:profile).permit(
      :account,
      :avatar
    )
  end
end