class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :first_name, :limit=>32, :null=> false
      t.string :last_name,  :limit=>32, :null=> false
      t.string :nick_name,  :limit=>32, :null=> false
      t.string :email,  :limit=>124

      t.timestamps
    end
  end
end
