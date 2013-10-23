# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120313223648) do

  create_table "ads", :force => true do |t|
    t.string   "product_image", :limit => 256,                    :null => false
    t.string   "product_link",  :limit => 256,                    :null => false
    t.string   "product_name",  :limit => 32,                     :null => false
    t.string   "ad_title",      :limit => 80,                     :null => false
    t.string   "ad_tracking",   :limit => 32
    t.text     "ad_body"
    t.boolean  "is_active",                    :default => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "rules", :force => true do |t|
    t.text     "product_ownership"
    t.text     "user_details"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "ad_id"
    t.integer  "ruleset_id"
  end

  create_table "rulesets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name", :limit => 32,  :null => false
    t.string   "last_name",  :limit => 32,  :null => false
    t.string   "nick_name",  :limit => 32,  :null => false
    t.string   "email",      :limit => 124
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
