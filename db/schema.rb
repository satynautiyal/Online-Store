# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_03_095531) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "category_of"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_categories_on_discarded_at"
  end

  create_table "notification_belongs", force: :cascade do |t|
    t.boolean "readed"
    t.integer "user_id", null: false
    t.integer "notification_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["notification_id"], name: "index_notification_belongs_on_notification_id"
    t.index ["user_id"], name: "index_notification_belongs_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "notifiable_type", null: false
    t.integer "notifiable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notification_of"
  end

  create_table "orders", force: :cascade do |t|
    t.string "orderable_type", null: false
    t.integer "orderable_id", null: false
    t.float "total_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.time "start_time"
    t.integer "qty"
    t.integer "user_id", null: false
    t.boolean "cart"
    t.time "end_time"
    t.date "date"
    t.integer "duration"
    t.index ["orderable_type", "orderable_id"], name: "index_orders_on_ordered"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "duration"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.time "start_time"
    t.time "end_time"
    t.integer "category_id", null: false
    t.datetime "discarded_at"
    t.index ["category_id"], name: "index_product_services_on_category_id"
    t.index ["discarded_at"], name: "index_product_services_on_discarded_at"
    t.index ["user_id"], name: "index_product_services_on_user_id"
  end

  create_table "product_variants", force: :cascade do |t|
    t.string "batch_no"
    t.string "weight"
    t.float "price"
    t.integer "quantity"
    t.date "expiry"
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_product_variants_on_discarded_at"
    t.index ["product_id"], name: "index_product_variants_on_product_id"
    t.index ["user_id"], name: "index_product_variants_on_user_id"
  end

  create_table "product_views", force: :cascade do |t|
    t.string "viewable_type", null: false
    t.integer "viewable_id", null: false
    t.string "user_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["viewable_type", "viewable_id"], name: "index_product_views_on_viewable"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "category_id", null: false
    t.datetime "discarded_at"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["discarded_at"], name: "index_products_on_discarded_at"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "search_products", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", null: false
    t.string "name"
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_variant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_variant_id"], name: "index_wishlists_on_product_variant_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "notification_belongs", "notifications"
  add_foreign_key "notification_belongs", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "product_services", "categories"
  add_foreign_key "product_services", "users"
  add_foreign_key "product_variants", "products"
  add_foreign_key "product_variants", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
  add_foreign_key "wishlists", "product_variants"
  add_foreign_key "wishlists", "users"
end
