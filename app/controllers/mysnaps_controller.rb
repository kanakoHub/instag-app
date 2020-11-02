class MysnapsController < ApplicationController
  def index
    @snaps = current_user.snaps
  end
end