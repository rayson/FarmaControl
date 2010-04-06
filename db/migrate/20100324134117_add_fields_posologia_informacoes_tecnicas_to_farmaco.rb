class AddFieldsPosologiaInformacoesTecnicasToFarmaco < ActiveRecord::Migration
  def self.up
    add_column(:farmacos, :posologia, :text, :null=>true)
    add_column(:farmacos, :informacoes_tecnicas, :text, :null=>true)
  end

  def self.down
    remove_column(:farmacos, :posologia)
    remove_column(:farmacos, :informacoes_tecnicas)
  end
end
