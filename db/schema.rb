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

ActiveRecord::Schema.define(version: 2022_01_16_063152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "_active_storage_attachments", id: false, force: :cascade do |t|
    t.integer "id", limit: 2
    t.string "name", limit: 12
    t.string "record_type", limit: 14
    t.integer "record_id", limit: 2
    t.integer "blob_id", limit: 2
    t.string "created_at", limit: 10
  end

  create_table "_active_storage_blobs", id: false, force: :cascade do |t|
    t.integer "id", limit: 2
    t.string "key", limit: 28
    t.string "filename", limit: 31
    t.string "content_type", limit: 10
    t.string "metadata", limit: 35
    t.string "service_name", limit: 6
    t.integer "byte_size"
    t.string "checksum", limit: 24
    t.string "created_at", limit: 10
  end

  create_table "_active_storage_variant_records", id: false, force: :cascade do |t|
    t.string "id", limit: 1
    t.string "blob_id", limit: 1
    t.string "variation_digest", limit: 1
  end

  create_table "_ar_internal_metadata", id: false, force: :cascade do |t|
    t.string "key", limit: 11
    t.string "value", limit: 11
    t.string "created_at", limit: 10
    t.string "updated_at", limit: 10
  end

  create_table "_categories", id: false, force: :cascade do |t|
    t.integer "id", limit: 2
    t.string "name", limit: 15
    t.integer "category_of", limit: 2
    t.string "created_at", limit: 10
    t.string "updated_at", limit: 10
    t.string "discarded_at", limit: 1
  end

  create_table "_notification_belongs", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "readed", limit: 2
    t.integer "user_id", limit: 2
    t.integer "notification_id", limit: 2
    t.string "created_at", limit: 10
    t.string "updated_at", limit: 10
  end

  create_table "_notifications", id: false, force: :cascade do |t|
    t.integer "id", limit: 2
    t.string "title", limit: 24
    t.string "content", limit: 167
    t.string "notifiable_type", limit: 14
    t.integer "notifiable_id", limit: 2
    t.string "created_at", limit: 10
    t.string "updated_at", limit: 10
  end

  create_table "_orders", id: false, force: :cascade do |t|
    t.integer "id", limit: 2
    t.string "orderable_type", limit: 14
    t.integer "orderable_id", limit: 2
    t.decimal "total_amount", precision: 6, scale: 1
    t.string "created_at", limit: 10
    t.string "updated_at", limit: 10
    t.string "start_time", limit: 36
    t.string "qty", limit: 1
    t.integer "user_id", limit: 2
    t.integer "cart", limit: 2
    t.string "end_time", limit: 36
    t.string "date", limit: 1
    t.string "duration", limit: 2
  end

  create_table "_product_services", id: false, force: :cascade do |t|
    t.integer "id", limit: 2
    t.string "name", limit: 7
    t.string "description", limit: 15
    t.integer "duration", limit: 2
    t.decimal "price", precision: 4, scale: 1
    t.string "created_at", limit: 10
    t.string "updated_at", limit: 10
    t.integer "user_id", limit: 2
    t.string "start_time", limit: 19
    t.string "end_time", limit: 19
    t.integer "category_id", limit: 2
    t.string "discarded_at", limit: 1
  end

  create_table "_product_variants", id: false, force: :cascade do |t|
    t.integer "id", limit: 2
    t.string "batch_no", limit: 129
    t.string "weight", limit: 8
    t.decimal "price", precision: 7, scale: 2
    t.integer "quantity"
    t.string "expiry", limit: 1
    t.integer "product_id", limit: 2
    t.string "created_at", limit: 10
    t.string "updated_at", limit: 10
    t.integer "user_id", limit: 2
    t.string "discarded_at", limit: 10
  end

  create_table "_product_views", id: false, force: :cascade do |t|
    t.integer "id", limit: 2
    t.string "viewable_type", limit: 14
    t.integer "viewable_id", limit: 2
    t.string "user_ip", limit: 15
    t.string "created_at", limit: 10
    t.string "updated_at", limit: 10
  end

  create_table "_products", id: false, force: :cascade do |t|
    t.integer "id", limit: 2
    t.string "name", limit: 86
    t.string "description", limit: 94
    t.string "created_at", limit: 10
    t.string "updated_at", limit: 10
    t.integer "user_id", limit: 2
    t.integer "category_id", limit: 2
    t.string "discarded_at", limit: 10
  end

  create_table "_schema_migrations", id: false, force: :cascade do |t|
    t.bigint "version"
  end

  create_table "_search_products", id: false, force: :cascade do |t|
    t.string "id", limit: 1
    t.string "created_at", limit: 1
    t.string "updated_at", limit: 1
  end

  create_table "_searches", id: false, force: :cascade do |t|
    t.string "id", limit: 1
    t.string "created_at", limit: 1
    t.string "updated_at", limit: 1
  end

  create_table "_sqlite_sequence", id: false, force: :cascade do |t|
    t.string "name", limit: 26
    t.integer "seq"
  end

  create_table "_users", id: false, force: :cascade do |t|
    t.integer "id", limit: 2
    t.string "email", limit: 17
    t.string "encrypted_password", limit: 60
    t.string "reset_password_token", limit: 1
    t.string "reset_password_sent_at", limit: 1
    t.string "remember_created_at", limit: 1
    t.string "created_at", limit: 10
    t.string "updated_at", limit: 10
    t.integer "role", limit: 2
    t.string "name", limit: 7
    t.string "discarded_at", limit: 10
  end

  create_table "_wishlists", id: false, force: :cascade do |t|
    t.integer "id", limit: 2
    t.integer "user_id", limit: 2
    t.integer "product_variant_id", limit: 2
    t.string "created_at", limit: 10
    t.string "updated_at", limit: 10
  end

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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.integer "category_of"
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
    t.string "user_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_variant_id", null: false
    t.index ["product_variant_id"], name: "index_product_views_on_product_variant_id"
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
  add_foreign_key "product_views", "product_variants"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
  add_foreign_key "wishlists", "product_variants"
  add_foreign_key "wishlists", "users"
end
