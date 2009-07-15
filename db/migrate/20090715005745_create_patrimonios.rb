class CreatePatrimonios < ActiveRecord::Migration
  def self.up
    create_table :patrimonios do |t|
      t.string :descricao
      t.string :situacao
      t.string :motivo
      t.timestamps
    end
  end

  def self.down
    drop_table :patrimonios
  end
end
