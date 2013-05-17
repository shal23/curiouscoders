class Tutorial < ActiveRecord::Base
  belongs_to :user
  attr_accessible :about, :title, :url, :tag_list

  validates_presence_of :title, :url

  acts_as_taggable_on :tags
end
