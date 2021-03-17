module UsersHelper


  def eventsany

      link_to('My Events', user_path(Current.user.id), class: 'btn btn-secondary') 
  end
    

  def userl(event)

    if DateTime.now.utc <= event.date
      content_tag(:td,  event.title ) +
      content_tag(:td, event.date ) 
    end
  end
  

  def userg(event)

    if DateTime.now.utc > event.date
      content_tag(:td,  event.title ) +
      content_tag(:td, event.date ) 
    end
  end

end
