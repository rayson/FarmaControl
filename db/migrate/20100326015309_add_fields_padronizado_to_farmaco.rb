class AddFieldsPadronizadoToFarmaco < ActiveRecord::Migration
  def self.up
    add_column(:farmacos,:padronizado,:boolean,:default=>false)
  end

  def self.down
    remove_column(:farmacos, :padronizado)
  end
end
