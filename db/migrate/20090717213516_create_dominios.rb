class CreateDominios < ActiveRecord::Migration
  def self.up
    create_table :dominios do |t|
      t.string :conteudo
      t.string :valor
      t.integer :grupo
      t.timestamps
    end
  end

  def self.down
    drop_table :dominios
  end
end
