class Conversation < ActiveRecord::Base
  belongs_to :team
  belongs_to :tutorial
  has_many :posts, :as => :postable

  attr_accessible :team_id, :tutorial_id, :when, :where, :url, :done
end