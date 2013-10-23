class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :product_image , :limit=>256, :null=> false
      t.string :product_link , :limit=>256, :null=> false
      t.string :product_name , :limit=>32, :null=> false
      t.string :ad_title ,:limit=>80, :null=> false
      t.string :ad_tracking , :limit=>32
      t.text   :ad_body
      t.boolean :is_active, :default=>false
      #t.integer :user_id
      t.timestamps
    end
  end
end
