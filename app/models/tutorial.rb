class Tutorial < ActiveRecord::Base
  belongs_to :user
  attr_accessible :about, :title, :url

  validates_presence_of :title, :url
end
