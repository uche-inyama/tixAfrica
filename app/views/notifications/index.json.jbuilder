json.array! @notifications do |notification|
  # json.recipient notification.recipient
  json.id notification.id
  json.user notification.user
  json.action notification.action
  json.notifiable do
    json.type "#{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
end