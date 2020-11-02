class MysnapsController < ApplicationController
  def index
    @snaps = Snap.all
    # binding.pry
  end
end