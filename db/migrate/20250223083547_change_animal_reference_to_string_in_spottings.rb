class ChangeAnimalReferenceToStringInSpottings < ActiveRecord::Migration[8.0]
  def change
    # Remove the old animal reference
    remove_reference :spottings, :animal, foreign_key: true

    # Add the new animal_name column
    add_column :spottings, :animal_name, :string, null: false
  end
end
