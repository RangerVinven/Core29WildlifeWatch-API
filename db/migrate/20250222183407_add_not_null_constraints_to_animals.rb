class AddNotNullConstraintsToAnimals < ActiveRecord::Migration[8.0]
  def change
    change_column_null :animals, :animal_name, false
  end
end
