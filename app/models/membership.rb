class Membership < ActiveRecord::Base
  attr_accessible :event_id, :member_id

  belongs_to :member, class_name: "User"
  belongs_to :event


end
