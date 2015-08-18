class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  private
  def room_params
    params[:room].permit(:name)
  end
end
