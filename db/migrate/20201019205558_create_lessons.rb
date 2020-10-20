class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.belongs_to :expert
      t.belongs_to :skill

      t.timestamps
    end
  end
end
