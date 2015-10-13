class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :post, index: true
      t.references :usuario, index: true
      t.integer :estado

      t.timestamps
    end
  end
end
