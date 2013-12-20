class Pin < ActiveRecord::Base
     belongs_to :user
     has_attached_file :image, :styles => { :medium => "1000x1000>", :thumb => "100x100>" }

validates :description, presence: true
validates :image, presence: true
acts_as_commontable
 acts_as_votable


end