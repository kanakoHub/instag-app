class ProfilesController < ApplicationController
  def show
    # @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update!(profile_params)
    imgsrc = url_for(@profile.avatar)
    render json: { imgsrc: imgsrc }
  end

  private

  def profile_params
    params.permit(:account, :avatar)
  end
end
