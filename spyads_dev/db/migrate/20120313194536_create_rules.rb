class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.text :product_ownership
      t.text :user_details

      t.timestamps
    end
  end
end
