# remove scenario's step
$(document).delegate '.remove', 'click', ->
  id = $(this).data('id')
  $('#' + id).append('<input type="text" name="project[scenarios_attributes][][_destroy]" value="1" hidden />')
  $('#' + id).hide()

# add step after
$(document).on 'click', '.add-after', ->
  id = $(this).data('id')
  new_id = new Date().getTime()
  title = $('#title').text().trim()
  order = $('#' + id + ' #project_scenarios_attributes__order').val()
  $('#' + id).after(
    '<div id=' + new_id + ' class="row">
      <input type="hidden" name="project[scenarios_attributes][][title]" value="' + title + '" />
      <div class="small-6 column">
        <input type="text" name="project[scenarios_attributes][][step]" />
      </div>
      <input type="hidden" name="project[scenarios_attributes][][order]" value="' + order + '" />
    </div>')
