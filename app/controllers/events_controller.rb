class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_parameter)
    redirect_to root_path
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = events.find(params[:id])
    if @event.update(article_params)
      redirect_to event_path, notice: '更新できました'
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
  def event_parameter
    params.require(:event).permit(:title, :content, :start_time)
  end
end
