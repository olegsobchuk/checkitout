$(document).on 'change', '#scenario_title_new #new_scenario_title', ->
  title = $(this).val()
  $('#scenario_title_new #edit').attr('href', "/projects/1/scenarios?title=#{title}")
