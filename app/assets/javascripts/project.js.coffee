$ ->
  $('#scenario_title_new #edit').click ->
    title = $('input#new_scenario_title').val()
    if title
      project = $(this).data('project')
      $(this).attr('href', "/projects/#{project}/scenarios?title=#{title}")
    else
      alert('Title should be exist')

  $('#scenario_title_new #remove').click ->
    $('input#new_scenario_title').val('')
