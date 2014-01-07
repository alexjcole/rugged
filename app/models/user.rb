class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :tiny => "50x50"}, :default_url => ""
  
  has_many :pins
  # This makes Usernames unique. They're are just called "names" in this app though
  validates_uniqueness_of :name
  validates :name, presence: true
  acts_as_commontator
  acts_as_voter
end
