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

ActiveRecord::Schema.define(:version => 20090720012726) do

  create_table "dominios", :force => true do |t|
    t.string   "conteudo"
    t.string   "valor"
    t.integer  "grupo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patrimonios", :force => true do |t|
    t.string   "titulo"
    t.string   "descricao"
    t.string   "situacao"
    t.string   "motivo"
    t.string   "voltagem"
    t.string   "tipo_conector"
    t.string   "estado_fisico"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "segmento"
  end

end
