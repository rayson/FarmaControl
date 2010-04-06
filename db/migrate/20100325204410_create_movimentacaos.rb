class CreateMovimentacaos < ActiveRecord::Migration
  def self.up
    create_table :movimentacaos do |t|
      t.references(:estoque, :tipo_movimentacao)
      t.integer :quantidade, :default=> 0
      t.text :observacao
      t.timestamps
    end
  end

  def self.down
    drop_table :movimentacaos
  end
end
