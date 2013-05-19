module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def check_for_unread_mail
    @user_messages = current_user.messages

    @user_messages.each do |message| 
      if message.read == false and message.show_recipient == true
        return true
      end
    end
    return false
  end

end
