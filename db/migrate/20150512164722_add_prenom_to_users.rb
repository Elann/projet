class AddPrenomToUsers < ActiveRecord::Migration

  def self.up
    add_column :users, :prenom, :string
  end
  
  def self.down
    remove_column :users, :promo
  end
end
