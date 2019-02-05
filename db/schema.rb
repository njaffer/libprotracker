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

ActiveRecord::Schema.define(version: 2019_02_05_180351) do

  create_table "cards", force: :cascade do |t|
    t.string "request_type"
    t.string "i_or_p"
    t.string "requester_name"
    t.string "requester_email"
    t.string "requester_div"
    t.string "contact_names"
    t.string "title"
    t.string "short_description"
    t.string "prev_work"
    t.string "short_name"
    t.string "benefits"
    t.string "goal_alignment"
    t.string "at_stake"
    t.string "ext_pressure"
    t.string "non_tech"
    t.string "priority"
    t.string "sponsor"
    t.string "more_info"
    t.string "start_cycle"
    t.string "end_cycle"
    t.string "card_status"
    t.string "ext_link"
    t.string "lit_lead"
    t.string "lit_dept"
    t.string "service_lead"
    t.string "other_contacts"
    t.string "comments"
    t.datetime "recorded_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "card_id"
    t.string "uemail"
    t.string "comment_txt"
    t.datetime "recorded_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complexities", force: :cascade do |t|
    t.integer "card_id"
    t.string "status"
    t.string "comments"
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_complexities_on_card_id"
  end

  create_table "cycles", force: :cascade do |t|
    t.string "cycle_name"
    t.string "description"
    t.date "start"
    t.date "end"
    t.boolean "current_cycle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "end_cycles", force: :cascade do |t|
    t.integer "card_id"
    t.string "status"
    t.string "rationale"
    t.string "expected_dur"
    t.string "cycle"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_end_cycles_on_card_id"
  end

  create_table "impacts", force: :cascade do |t|
    t.integer "card_id"
    t.string "status"
    t.string "comments"
    t.datetime "recorded_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_impacts_on_card_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "current_cycle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strategic_sortings", force: :cascade do |t|
    t.integer "card_id"
    t.string "domain"
    t.string "enthusiasm"
    t.string "knowledge"
    t.string "resource"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_strategic_sortings_on_card_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "pswd"
    t.datetime "member_since"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
