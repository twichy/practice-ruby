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

ActiveRecord::Schema.define(version: 2019_12_11_214804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_drivers", force: :cascade do |t|
    t.bigint "car_id", null: false
    t.bigint "driver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_car_drivers_on_car_id"
    t.index ["driver_id"], name: "index_car_drivers_on_driver_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "title"
    t.string "car_type"
    t.integer "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.index ["imageable_type", "imageable_id"], name: "index_cars_on_imageable_type_and_imageable_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.date "birth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.index ["imageable_type", "imageable_id"], name: "index_drivers_on_imageable_type_and_imageable_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "filename"
    t.string "content_type"
    t.binary "file_contents"
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  add_foreign_key "car_drivers", "cars"
  add_foreign_key "car_drivers", "drivers"
end
