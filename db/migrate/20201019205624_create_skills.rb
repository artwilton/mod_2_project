class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :difficult_level
      t.belongs_to :expert
      t.belongs_to :category

      t.timestamps
    end
  end
end
