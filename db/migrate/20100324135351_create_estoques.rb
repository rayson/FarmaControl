class CreateEstoques < ActiveRecord::Migration
  def self.up
    create_table :estoques do |t|
      t.references(:farmaco, :local)
      t.string :responsavel, :null=> true
      t.integer :quantidade, :null=> false, :default=> 0
      t.timestamps
    end
  end

  def self.down
    drop_table :estoques
  end
end
