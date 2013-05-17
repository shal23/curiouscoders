class Tutorial < ActiveRecord::Base
  belongs_to :user

  has_many :posts, :as => :postable

  attr_accessible :about, :title, :url

  validates_presence_of :title, :url
end
