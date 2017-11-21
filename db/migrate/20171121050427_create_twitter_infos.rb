class CreateTwitterInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :twitter_infos do |t|

      t.timestamps
    end
  end
end
