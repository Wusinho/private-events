module UsersHelper
  def eventsany
    link_to('My Events', user_path(Current.user.id), class: 'btn btn-secondary')
  end

  def userl(event)
    return unless DateTime.now.utc <= event.date

    content_tag(:td, event.title) +
      content_tag(:td, event.date)
  end

  def events
    if @my_events.any?
      render 'cevents'

    else
      render 'jumbo'

    end
  end
end
