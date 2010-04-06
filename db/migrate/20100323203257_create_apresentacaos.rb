class CreateApresentacaos < ActiveRecord::Migration
  def self.up
    create_table :apresentacaos do |t|
      t.string :texto, :limit=> 150, :null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :apresentacaos
  end
end
