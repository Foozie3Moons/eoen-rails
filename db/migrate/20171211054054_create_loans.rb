class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.string :name
      t.integer :amount
      t.integer :down_payment
      t.decimal :apr
      t.integer :payments_per_year
      t.integer :lifespan
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
