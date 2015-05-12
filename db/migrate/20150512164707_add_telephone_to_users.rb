class AddTelephoneToUsers < ActiveRecord::Migration

  def self.up
    add_column :users, :tel, :string
  end
  
  def self.down
    remove_column :users, :tel
  end
end
