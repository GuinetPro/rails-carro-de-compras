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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150705205108) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "attachments", force: true do |t|
    t.string   "nombre"
    t.string   "extension"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["post_id"], name: "index_attachments_on_post_id", using: :btree

  create_table "friendships", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id", using: :btree
  add_index "friendships", ["usuario_id"], name: "index_friendships_on_usuario_id", using: :btree

  create_table "payments", force: true do |t|
    t.integer  "post_id"
    t.integer  "usuario_id"
    t.integer  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["post_id"], name: "index_payments_on_post_id", using: :btree
  add_index "payments", ["usuario_id"], name: "index_payments_on_usuario_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "contenido"
    t.string   "extension"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "costo",      precision: 10, scale: 2
  end

  add_index "posts", ["usuario_id"], name: "index_posts_on_usuario_id", using: :btree

  create_table "transactions", force: true do |t|
    t.string   "token"
    t.string   "payerid"
    t.integer  "usuario_id"
    t.decimal  "total",      precision: 10, scale: 3
    t.string   "respuesta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["usuario_id"], name: "index_transactions_on_usuario_id", using: :btree

  create_table "usuarios", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
