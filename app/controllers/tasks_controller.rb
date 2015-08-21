class TasksController < ApplicationController
  before_action :require_login
  before_action :check_user_has_room, only: [:new, :create, :edit, :update, :destroy]

  def new
    @task = room.tasks.build
  end

  def create
    @task = room.tasks.build(task_params)
    if @task.save
      redirect_to room_path(room)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to room_path(room)
    else
      render :edit
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to room_path(room)
  end

  private
  def task_params
    params[:task].permit(:name, :day, :hour, :minute)
  end

  def room
    @room ||= Room.find(params[:room_id])
  end
  helper_method :room

  def check_user_has_room
    unless current_user.has_room?(room)
      flash[:error] = "You do not have this room"
      redirect_to root_path
    end
  end

end