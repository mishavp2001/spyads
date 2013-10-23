class LinkRulesAndAds < ActiveRecord::Migration
  def change
    add_column :rules, :ad_id, :integer
  end
end
