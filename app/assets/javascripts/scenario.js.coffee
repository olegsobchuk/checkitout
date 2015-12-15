# remove scenario's step
$(document).delegate '.remove', 'click', ->
  id = $(this).parent().data('id')
  $('#' + id).append('<input type="text" name="project[scenarios_attributes][][_destroy]" value="1" hidden />')
  $('#' + id).hide()

# add step after
$(document).on 'click', '.add-after', ->
  insertStepBeforeOrAfter(this, 'insertAfter')

$(document).on 'click', '.add-before', ->
  insertStepBeforeOrAfter(this, 'insertBefore')

insertStepBeforeOrAfter = (_this, insertBeforeOrAfter) ->
  $('.unfinished').remove()
  id = $(_this).parent().data('id')
  new_id = new Date().getTime()
  title = $('#title').text().trim()
  order = $("##{id} #project_scenarios_attributes__order").val()
  $('#step_new').clone().attr('id', 'new_step_' + new_id).addClass('unfinished').show()[insertBeforeOrAfter]('#' + id)
  $('#new_step_' + new_id + ' #cancel_step, #add_step').data('id', 'new_step_' + new_id)



remove_id = (id)->
  $('#' + id).remove()

$(document).on 'click', '#cancel_step', ->
  id = $(this).data('id')
  remove_id(id)

$(document).on 'click', '#add_step', ->
  id = $(this).data('id')
  $("##{id}").removeClass('unfinished')
  new_step_field = $("##{id} #project_scenarios_attributes__step")
  new_step = new_step_field.val()
  if new_step
    $('#' + id + ' #add_step, #' + id + ' #cancel_step').remove()
    $('#' + id + ' .step_result').append(new_step)
    new_step_field.hide()
    $('#' + id + ' #control_buttons').show().data('id', id)
  else
    alert("Can't been added empty step!")
