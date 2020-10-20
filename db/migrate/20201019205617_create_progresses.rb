class CreateProgresses < ActiveRecord::Migration[6.0]
  def change
    create_table :progresses do |t|
      t.string :status

      t.belongs_to :lesson
      t.belongs_to :student

      t.timestamps
    end
  end
end
