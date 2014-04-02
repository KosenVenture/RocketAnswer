module ApplicationHelper
  def bootstrap_alert
    content_tag :div, class: 'alert alert-danger' do
      alert
    end if alert
  end

  def bootstrap_notice
    content_tag :div, class: 'alert alert-info' do
      notice
    end if notice
  end
end
