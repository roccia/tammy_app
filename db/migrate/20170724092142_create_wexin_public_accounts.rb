class CreateWexinPublicAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :wexin_public_accounts do |t|

      t.timestamps
    end
  end
end
