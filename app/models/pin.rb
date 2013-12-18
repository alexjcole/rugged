class Pin < ActiveRecord::Base
     belongs_to :user
     has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

validates :description, presence: true
validates :image, presence: true

has_reputation :votes, source: :user, aggregated_by: :sum

acts_as_commontable

end