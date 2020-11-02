class ProfilesController < ApplicationController
  
  def show
    @user = current_user
    @profile = @user.profile
    @snap = Snap.all
  end

  def update
    @profile = current_user.profile
    @profile.update!(profile_params)
    imgsrc = url_for(@profile.avatar)
    render json: { imgsrc: imgsrc }
  end

  private

  def profile_params
    params.require(:profile).permit(:account, :avatar)
  end
end