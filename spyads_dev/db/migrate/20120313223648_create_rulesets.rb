class CreateRulesets < ActiveRecord::Migration
  def change
    create_table :rulesets do |t|
      t.string :name, :unique => true

      t.timestamps
    end
    
    add_column :rules, :ruleset_id, :integer

  end
end
