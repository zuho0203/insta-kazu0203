class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_params)
    redirect_to events_path
  end

  def show
  end

  def edit
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    redirect_to events_path, notice: '削除に成功しました'
  end

  private
  def event_params
    params.require(:event).permit(:title, :content, :start_time)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
