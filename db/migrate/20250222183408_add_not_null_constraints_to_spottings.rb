class AddNotNullConstraintsToSpottings < ActiveRecord::Migration[8.0]
  def change
    change_column_null :spottings, :animal_id, false
    change_column_null :spottings, :user_id, false
    change_column_null :spottings, :location, false
  end
end
