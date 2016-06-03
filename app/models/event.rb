class Event < ActiveRecord::Base
  validates_presence_of :name
  #不知是否必須？
end
