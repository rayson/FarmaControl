class AddFieldsControladoToFarmaco < ActiveRecord::Migration
  def self.up
    add_column :farmacos, :controlado, :boolean, :default=> false
  end

  def self.down
    remove_column(:farmacos, :controlado)
  end
end
