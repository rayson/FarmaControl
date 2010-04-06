class CreateTipoMovimentacaos < ActiveRecord::Migration
  def self.up
    create_table :tipo_movimentacaos do |t|
      t.string :nome, :limit=>50
      t.belongs_to :origem, :class_name=>"Local"
      t.belongs_to :destino, :class_name=>"Local"
      t.integer :quantidade
      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_movimentacaos
  end
end
