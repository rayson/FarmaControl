class CreateFormas < ActiveRecord::Migration
  def self.up
    create_table :formas do |t|
      t.string :texto, :sigla
      t.timestamps
    end
  end

  def self.down
    drop_table :formas
  end
end
