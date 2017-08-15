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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170815150226) do

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "resume_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resumes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "mobile_number"
    t.string "birthday"
    t.string "college"
    t.text "introduction"
    t.string "resume_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cv_images"
    t.string "email"
    t.string "gender"
    t.string "location"
  end

  create_table "wexin_public_accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "weixin_secret_key"
    t.string "weixin_token"
    t.index ["weixin_secret_key"], name: "index_wexin_public_accounts_on_weixin_secret_key"
    t.index ["weixin_token"], name: "index_wexin_public_accounts_on_weixin_token"
  end

end
