# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_02_183718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "email"
    t.string "phone"
    t.text "about"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "campaign_applications", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "influencer_id"
    t.bigint "campaign_id"
    t.index ["campaign_id"], name: "index_campaign_applications_on_campaign_id"
    t.index ["influencer_id"], name: "index_campaign_applications_on_influencer_id"
  end

  create_table "campaign_briefs", force: :cascade do |t|
    t.text "description"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "campaign_shortlist_id"
    t.index ["campaign_shortlist_id"], name: "index_campaign_briefs_on_campaign_shortlist_id"
  end

  create_table "campaign_shortlists", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "campaign_id"
    t.index ["campaign_id"], name: "index_campaign_shortlists_on_campaign_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.text "about"
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.boolean "campaign_active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_campaigns_on_brand_id"
  end

  create_table "influencers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "middle_name"
    t.string "email"
    t.string "phone"
    t.string "gender"
    t.date "dob"
    t.text "bio"
    t.text "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "campaign_shortlist_id"
    t.index ["campaign_shortlist_id"], name: "index_influencers_on_campaign_shortlist_id"
  end

  create_table "influnecer_social_accounts", force: :cascade do |t|
    t.string "platform", null: false
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "influencers_id"
    t.index ["influencers_id"], name: "index_influnecer_social_accounts_on_influencers_id"
  end

  add_foreign_key "campaign_applications", "campaigns"
  add_foreign_key "campaign_applications", "influencers"
  add_foreign_key "campaign_briefs", "campaign_shortlists"
  add_foreign_key "campaign_shortlists", "campaigns"
  add_foreign_key "campaigns", "brands"
  add_foreign_key "influencers", "campaign_shortlists"
  add_foreign_key "influnecer_social_accounts", "influencers", column: "influencers_id"
end
