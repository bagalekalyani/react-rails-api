class RenameColumn < ActiveRecord::Migration
    def change
        rename_column :users, :password, :password_hash
        rename_column :users, :salt, :password_salt
    end
end
