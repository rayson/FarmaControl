# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100406134102) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "salt"
    t.string   "crypted_password"
    t.string   "role"
    t.string   "modules"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apresentacaos", :force => true do |t|
    t.string   "texto",      :limit => 150, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estoques", :force => true do |t|
    t.integer  "farmaco_id"
    t.integer  "local_id"
    t.string   "responsavel"
    t.integer  "quantidade",  :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "farmacos", :force => true do |t|
    t.integer  "apresentacao_id"
    t.integer  "forma_id"
    t.string   "farmaco",              :limit => 100,                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "posologia"
    t.text     "informacoes_tecnicas"
    t.boolean  "controlado",                          :default => false
    t.boolean  "padronizado",                         :default => false
  end

  create_table "formas", :force => true do |t|
    t.string   "texto"
    t.string   "sigla"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "historico_estoques", :force => true do |t|
    t.integer  "farmaco_id"
    t.integer  "local_id"
    t.string   "responsavel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locals", :force => true do |t|
    t.string   "nome",       :limit => 50,  :null => false
    t.string   "empresa",    :limit => 100
    t.string   "sigla",      :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movimentacaos", :force => true do |t|
    t.integer  "estoque_id"
    t.integer  "tipo_movimentacao_id"
    t.integer  "quantidade",           :default => 0
    t.text     "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "farmaco_id"
  end

  create_table "tipo_movimentacaos", :force => true do |t|
    t.string   "nome",       :limit => 50
    t.integer  "origem_id"
    t.integer  "destino_id"
    t.integer  "quantidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
