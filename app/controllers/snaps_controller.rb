class SnapsController < ApplicationController
  def index
    @snaps = Snap.all.order(id: "DESC")
  end

  def new
    @snap = current_user.snaps.build
  end

  def create
    @snap = current_user.snaps.build(snap_params)
    if @snap.save
      redirect_to root_path, notice: '保存しました!'
    else
      flash.now[:error] = '保存に失敗しました。'
      render :new
    end
  end

  def show
    @snap = Snap.find(params[:id])
    @comments = @snap.comments.order(id: "DESC")
  end

  private

  def snap_params
    params.require(:snap).permit(:description, snaps: [])
  end
end
