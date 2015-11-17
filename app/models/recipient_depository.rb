class RecipientDepository < ActiveRecord::Base
  belongs_to :student
  belongs_to :contact_list
end
