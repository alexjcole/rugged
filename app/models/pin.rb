class Pin < ActiveRecord::Base
     belongs_to :user
     has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100>" }

validates :image, presence: true
acts_as_commontable
acts_as_votable

 


end