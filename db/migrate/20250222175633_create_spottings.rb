class CreateSpottings < ActiveRecord::Migration[8.0]
  def change
    create_table :spottings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
