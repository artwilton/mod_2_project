class Transactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :expert
      t.belongs_to :student
      t.integer :status, default: 0
      t.string :token
      t.string :charge_id
      t.string :error_message
      t.string :customer_id
      t.integer :payment_gateway
      t.timestamps
    end
    add_money :transactions, :price, currency: { present: false }
  end
end
