class Event < ActiveRecord::Base
  attr_accessible :User_id, :Event_id, :hour, :minute, :am, :date, :day, :is_deleted, :event_instances_attributes

  has_many :event_instances
  accepts_nested_attributes_for :event_instances, allow_destroy: true
end
