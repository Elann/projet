class AddPromoToUsers < ActiveRecord::Migration

  def self.up
    add_column :users, :promo, :integer
  end
  
  def self.down
    remove_column :users, :promo
  end
end
