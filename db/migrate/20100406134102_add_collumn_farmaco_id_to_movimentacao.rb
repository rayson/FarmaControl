class AddCollumnFarmacoIdToMovimentacao < ActiveRecord::Migration
  def self.up
    add_column :movimentacaos, :farmaco_id, :integer
  end

  def self.down
    remove_column(:movimentacaos, :farmaco_id)
  end
end
