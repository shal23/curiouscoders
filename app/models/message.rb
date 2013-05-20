class Message < ActiveRecord::Base
  attr_accessible :content, :read, :recipient_id, :sender_id, :show_recipient, :show_sender, :title, :user_id, :recipient_name

  belongs_to :user

  default_scope :order => 'created_at DESC'

  validates_presence_of :user_id, :message => "Could not find user with that name."
end
