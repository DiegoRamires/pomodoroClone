$(document).on 'turbolinks:load', ->
  seconds = 1;
  minutes = 0;
  hours = 0;
  
  window.stopwatch_start = () ->
    window.interval = window.setInterval(() ->
      if (seconds == 60)
        minutes++;
        seconds = 0;

      if (minutes == 60)
        hours++;
        minutes = 0;
        seconds = 0;

      if (hours < 10)
        stopwatch_hour = '0'+ hours
      else
        stopwatch_hour = hours;

      if (minutes < 10)
        stopwatch_minute = '0'+ minutes
      else
        stopwatch_minute = minutes;

      if (seconds < 10)
        stopwatch_second = '0'+ seconds
      else
        stopwatch_second = seconds;

      timer = stopwatch_hour+':'+stopwatch_minute+':'+stopwatch_second;
      window.document.title = timer;
      $('.timer').html(timer);
      
      seconds++;

    , 1000)

  window.stopwatch_pause = () ->
    clearInterval(window.interval);

  window.stopwatch_stop = () ->
    clearInterval(window.interval);
    $('.timer').html('00:00:00');
    seconds = 1;
    minutes = 0;
    hours = 0;

  $('#btnStart').on 'click', ->
    window.stopwatch_start()
    return

  $('#btnPause').on 'click', ->
    window.stopwatch_pause()
    return

  $('#btnStop').on 'click', ->
    window.stopwatch_stop()
    return

return