module ApplicationHelper
  def site_title_helper
    'Spare Time Startups' + (Rails.env == 'production' ? "" : (" " + Rails.env))
  end

  def body_css_classes
    [
      underscored_controller_name,
      underscored_controller_name + '_' + action_name
    ].join(' ')
  end
end
