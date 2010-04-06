class CreateLocals < ActiveRecord::Migration
  def self.up
    create_table :locals do |t|
      t.string :nome, :limit=> 50, :null=>false
      t.string :empresa, :limit=>100, :null=>true
      t.string :sigla, :limit=>10
      t.timestamps
    end
  end

  def self.down
    drop_table :locals
  end
end
