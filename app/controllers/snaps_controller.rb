class SnapsController < ApplicationController
  
  def index
    @snaps = Snap.all
  end

  def new
    @snap = current_user.snaps.build
  end

  def create
    @snap = current_user.snaps.build(snap_params)
    if @snap.save
      redirect_to root_path, notice: 'I saved it!'
    else
      flash.now[:error] = 'I failed to save it.'
      render :new
    end
  end

  private

  def snap_params
    params.require(:snap).permit(:description, snaps: [])
  end
end