class StopwatchController < ApplicationController
  before_action :set_stopwatch, only: [:update, :show]

  def create
    @stopwatch = Stopwatch.new(stopwatch_params)

    respond_to do |format|
      if @stopwatch.save
        format.json { render :show, status: :created, location: @stopwatch }
      else
        format.json { render json: @stopwatch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stopwatch.update(stopwatch_params)
        format.json { render :show, status: :ok, location: @stopwatch_params }
      else
        format.json { render json: @stopwatch_params.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private
    def set_stopwatch
      @stopwatch = Stopwatch.find(params[:id])
    end

    def stopwatch_params
      params.require(:stopwatch).permit(:work_cyle, :fast_pause, :long_pause, :has_sound_on_terminate).merge(user_id: current_user.id)
    end
end
