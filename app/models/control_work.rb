class ControlWork < ActiveRecord::Base
  belongs_to :period
  belongs_to :user
end
