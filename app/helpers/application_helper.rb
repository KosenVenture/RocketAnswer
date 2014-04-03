module ApplicationHelper
  def bootstrap_alert
    content_tag :div, class: 'alert alert-danger' do
      concat content_tag(:button, '×', class: 'close', data: { dismiss: 'alert' })
      concat content_tag(:i, '', class: 'fa fa-exclamation-triangle')
      concat content_tag(:span, alert, class: 'message')
    end if alert
  end

  def bootstrap_notice
    content_tag :div, class: 'alert alert-info' do
      concat content_tag(:button, '×', class: 'close', data: { dismiss: 'alert' })
      concat content_tag(:i, '', class: 'fa fa-info-circle')
      concat content_tag(:span, notice, class: 'message')
    end if notice
  end
end
