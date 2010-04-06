class CreateFarmacos < ActiveRecord::Migration
  def self.up
    create_table :farmacos do |t|
      t.references :apresentacao, :forma
      t.string :farmaco, :limit=> 100, :null=> false
  
      t.timestamps
    end
  end

  def self.down
    drop_table :farmacos
  end
end
