$(document).on 'turbolinks:load', ->
  seconds = 0;
  minutes = 25;
  hours = 0;
  state = 0;  # (0 = stopped, 1 = started, 2 = paused)
  work_cycle = 25;
  fast_pause = 5;
  long_pause = 30;
  has_sound_on_terminate = true;

  updateView = () ->
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

  window.getPomodoroSettings = () ->
    work_cycle = $('#stopwatch_work_cyle').val();
    fast_pause = $('#stopwatch_fast_pause').val()
    long_pause = $('#stopwatch_long_pause').val()
    has_sound_on_terminate = $("input#has_sound_on_terminate").prop('checked')

  window.stopwatch_start = () ->        
    if (state != 1)
      state = 1;
      updateView()
      
      window.interval = window.setInterval(() ->
        if (hours == 0 && minutes == 0 && seconds == 0)
          window.stopwatch_stop()
          return

        if (seconds == 0)
          minutes--;
          seconds = 59;

        if (minutes == -1)
          hours--;
          minutes = 59;
          seconds = 59;

        updateView()
        
        seconds--;

      , 1000)

  a=new AudioContext() 

  beep = (vol, freq, duration) ->
    v=a.createOscillator()
    u=a.createGain()
    v.connect(u)
    v.frequency.value=freq
    v.type="square"
    u.connect(a.destination)
    u.gain.value=vol*0.01
    v.start(a.currentTime)
    v.stop(a.currentTime+duration*0.001)

  window.stopwatch_pause = () ->
    state = 2;
    clearInterval(window.interval);

  window.stopwatch_stop = () ->
    state = 0;
    clearInterval(window.interval);
    $('.timer').html('00:00:00');
    window.document.title = '00:00:00'
    
    if (has_sound_on_terminate)
      beep(100, 500, 500)

    seconds = 0;
    minutes = 0;
    hours = 0;

  $('#btnStart').on 'click', ->
    if (state == 0) 
      window.getPomodoroSettings()
      if (work_cycle > 0)
        minutes = work_cycle
      else
        minutes = 25

    window.stopwatch_start()
    return

  $('#btnPause').on 'click', ->
    window.stopwatch_pause()
    return

  $('#btnStop').on 'click', ->
    window.stopwatch_stop()
    return

  $('#btnFastPause').on 'click', ->
    if (state == 0) 
      window.getPomodoroSettings()
      if (fast_pause > 0)
        minutes = fast_pause
      else
        minutes = 5
    window.stopwatch_start()
    return

  $('#btnLongPause').on 'click', ->
    if (state == 0) 
      window.getPomodoroSettings()
      if (long_pause > 0)
        minutes = long_pause
      else
        minutes = 10
    window.stopwatch_start()
    return

return