class Message < ActiveRecord::Base
  attr_accessible :content, :read, :recipient_id, :sender_id, :show_recipient, :show_sender, :title, :user_id

  belongs_to :user

  default_scope :order => 'created_at DESC'
end
