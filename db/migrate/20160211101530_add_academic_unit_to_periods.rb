class AddAcademicUnitToPeriods < ActiveRecord::Migration
  def change
    add_reference :periods, :academic_unit, index: true, foreign_key: true
  end
end
