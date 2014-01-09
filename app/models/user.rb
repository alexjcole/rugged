class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :tiny => "50x50"}, :default_url => "http://i942.photobucket.com/albums/ad264/alexjcole2/rugged-default_zps3f1d1b36.png"
  
  has_many :pins
  # This makes Usernames unique. They're are just called "names" in this app though

  validates :name, presence: true
  validates :name, uniqueness: true, if: -> { self.name.present? }
  acts_as_commontator
  acts_as_voter
end
