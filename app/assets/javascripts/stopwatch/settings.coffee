$(document).on 'turbolinks:load', ->
  $('.edit-settings').on 'click', (e) =>
    $('#pomodoro_settings').modal();
    $('#pomodoro_settings').modal('open');
    return false
  
  $('.change-settings').on 'submit', (e) ->
    id = $("#stopwatch_id").val()
    
    if (id == '')
      requestType = 'POST'
      requestUrl = e.target.action
    else  
      requestType = 'PATCH' 
      requestUrl = '/stopwatch/'+ id
    
    $.ajax requestUrl,
        type: requestType
        dataType: 'json',
        data: {
          stopwatch: {
            work_cyle: $('#stopwatch_work_cyle').val()
            fast_pause: $('#stopwatch_fast_pause').val()
            long_pause: $('#stopwatch_long_pause').val()
            has_sound_on_terminate: $("input#has_sound_on_terminate").prop('checked')
          }
        }
        success: (data, text, jqXHR) ->
          $("#stopwatch_id").val(data.id)
          M.toast({ html: 'Settings saved!&nbsp;<b>:)</b>', inDuration: 4000, classes: 'green'})
          window.getPomodoroSettings()
        error: (jqXHR, textStatus, errorThrown) ->
          if jqXHR.status == 422
            M.toast({ html: 'jqXHR.responseText', inDuration: 4000, classes: 'red' })
          else
            M.toast({ html: 'Problem in Save Settings &nbsp;<b>:(</b>', inDuration: 4000, classes: 'red'})

    $('#pomodoro_settings').modal('close')
    return false