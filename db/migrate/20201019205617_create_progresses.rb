class CreateProgresses < ActiveRecord::Migration[6.0]
  def change
    create_table :progresses do |t|

      t.timestamps
    end
  end
end
