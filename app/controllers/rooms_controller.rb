class RoomsController < ApplicationController
  before_action :require_login
  before_action :check_user_has_room, only: [:show]

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

  def check_user_has_room
    unless current_user.has_room?(Room.find(params[:id]))
      flash[:error] = "You do not have this room"
      redirect_to root_path
    end
  end
end
