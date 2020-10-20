class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :email
      t.boolean :expert?
      t.string :password_digest

      t.string :stripe_plan_name
      t.string :stripe_customer_id

      t.timestamps
    end
    add_money :users, :price, currency: { present: true }
  end
end
