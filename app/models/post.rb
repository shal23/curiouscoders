class Post < ActiveRecord::Base
  belongs_to :user

  belongs_to :postable, :polymorphic => true

  attr_accessible :content, :title, :postable_type, :postable_id, :user

  before_save :capitalize

  def capitalize
  	self.postable_type.capitalize!
  end
end
