class User < ActiveRecord::Base
  has_many :tutorials
  has_many :memberships
  has_many :teams, :through => :memberships

  has_many :posts, :as => :postable

  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, #:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :location, :time_zone, :school, :occupation, :google_plus, :about

  
end
