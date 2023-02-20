module Shared::MessagesHelper

  
  # if there are no previous messages
  def remove_link_to_messages
    if @is_messenger == 'false'
      if @messages_to_display_offset != 0
        'shared/empty_partial'
      else
        'shared/load_more_messages/window/remove_more_messages_link' 
      end
    else
      'shared/empty_partial'
    end
  end

  # in the messenger load previous messages until the scroll bar appears
  def autoload_messenger_messages
    if @is_messenger == 'true'
      # if previous messages exist, load them
      if @messages_to_display_offset != 0
        'shared/load_more_messages/messenger/load_previous_messages'
      else
        # remove load previous messages link
        'shared/load_more_messages/messenger/remove_previous_messages_link'
      end
    else
      'shared/empty_partial'
    end
  end

  def append_previous_messages_partial_path
    # if a conversation is opened in the messenger
    if @is_messenger == 'true'
      'shared/load_more_messages/messenger/append_messages'
    else
      'shared/load_more_messages/window/append_messages'
    end
  end

  def replace_link_to_private_messages_partial_path
    if @is_messenger == 'true'
      'private/messages/load_more_messages/messenger/replace_link_to_messages'
    else
      'private/messages/load_more_messages/window/replace_link_to_messages'
    end
  end


end
