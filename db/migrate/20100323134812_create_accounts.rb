class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts, :force => true do |t|
      t.string      :name, :surname, :email, :salt, :crypted_password, :role, :modules
      t.timestamps
    end

    # I'll create the first account
    Account.create({:email => "rayponet@yahoo.com.br",
                    :name => "Rayson",
                    :surname => "Silva",
                    :password => "pollray1997",
                    :password_confirmation => "pollray1997",
                    :role => "administrator" })
  end

  def self.down
    drop_table "accounts"
  end
end