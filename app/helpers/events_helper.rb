module EventsHelper

  def navbar
    if Current.user   
      content_tag(:span, Current.user.username , class: %w[navbar-text mr-2]) +
      link_to('Log Out', logout_path, method: :delete, data: { confirm: 'Are you sure?' }, class:"btn btn-secondary")
    else
      link_to('Sign Up', sign_up_path, class: 'nav-link active') +
      link_to('Sign In', sign_in_path, class: 'nav-link active')
    end 
  end

  def notice
    content_tag(:div, flash[:notice], class: %w[alert alert-info mt-0]) if flash[:notice]
  end

  def alert
    content_tag(:div, flash[:alert], class: %w[alert alert-info mt-0]) if flash[:alert]
  end

  def indexUser
    if Current.user
      content_tag :div, class: "col-4" do
        render 'form'
      end
    end
  end

  def indexSignedFC
    if Current.user
      content_tag :div, class: "col-8" do
        render 'feedcurrent'
      end

    else
      
        content_tag :div, class: "col-12" do
          render 'feedcurrent'
        end
      
    end
  end




end
