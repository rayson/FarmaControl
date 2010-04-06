class CreateHistoricoEstoques < ActiveRecord::Migration
  def self.up
    create_table :historico_estoques do |t|
      t.references(:farmaco, :local)
      t.string :responsavel, :null=> true
      t.int  :quantidade, :null=> false, :default=> 0
      t.timestamps
    end
  end

  def self.down
    drop_table :historico_estoques
  end
end
