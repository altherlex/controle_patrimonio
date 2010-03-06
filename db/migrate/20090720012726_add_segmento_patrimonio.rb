class AddSegmentoPatrimonio < ActiveRecord::Migration
  def self.up
    add_column :patrimonios, :segmento, :string
  end

  def self.down
    remove_column :patrimonios, :segmento
  end
end
