module EventsHelper
  def navbar
    if Current.user
      content_tag(:span, Current.user.username, class: %w[navbar-text mr-2]) +
        link_to('New Event', new_event_path, class: 'btn btn-secondary') +
        link_to('My Events', user_path(Current.user.id), class: 'btn btn-secondary') +
        link_to('Log Out', sign_out_path, data: { confirm: 'Are you sure?' }, class: 'btn btn-secondary')
    else
      link_to('Sign In', sign_in_path, class: 'nav-link active') +
        link_to('Create User', new_user_path, class: 'nav-link active')
    end
  end

  def notice
    content_tag(:div, flash[:notice], class: %w[alert alert-info mt-0]) if flash[:notice]
  end

  def alert
    content_tag(:div, flash[:alert], class: %w[alert alert-info mt-0]) if flash[:alert]
  end

  def edit(event)
    if set_current_user && set_current_user.id == event.user_id
      content_tag(:td, link_to('Edit', edit_event_path(event)), class: 'text-center') +
        content_tag(:td)
    else
      content_tag(:td) +
        content_tag(:td)
    end
  end

  def button(event)
    if set_current_user && set_current_user.attended_events.where(id: event.id).none?
      content_tag(:td, link_to('Attend', attendances_path(event_id: event.id), method: :post, class: 'btn btn-success btn-sm'), class: 'text-center') +
        content_tag(:td)

    elsif set_current_user
      content_tag(:td, content_tag(:button, 'Already attending', class: 'btn btn-light btn-sm disabled'), class: 'text-center')

    end
  end

  def editevent
    link_to('Edit', edit_event_path(@event), class: 'btn btn-warning') if set_current_user && set_current_user.id == @event.user_id
  end
end
