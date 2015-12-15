module ScriptHelper
  def start_button
    id = "first_step_#{Time.now.to_i}"
    link_tag = link_to('START', 'javascript:void(false)', id: 'start', class: 'button')
    content_tag(:div, class: 'row') do
      content_tag(:div, class: ['large-12', 'columns'], id: id) do
        content_tag(:center, link_tag, data: { id: id })
      end
    end
  end
end
