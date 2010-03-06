class CreatePatrimonios < ActiveRecord::Migration
  def self.up
    create_table :patrimonios do |t|
      t.string :titulo
      t.string :descricao
      t.string :situacao
      t.string :motivo
      
      t.string :voltagem
      t.string :tipo_conector
      t.string :estado_fisico
      
      t.timestamps
    end
  end

  def self.down
    drop_table :patrimonios
  end
end
