class HomeController < ApplicationController
  def index
    if current_user.present?
      @stopwatch = Stopwatch.find_by(user_id: current_user.id)  

      unless @stopwatch.present?  
        @stopwatch = Stopwatch.new(work_cyle: 25, fast_pause: 5, long_pause: 30, has_sound_on_terminate: true)
      end
    end  
  end
end
