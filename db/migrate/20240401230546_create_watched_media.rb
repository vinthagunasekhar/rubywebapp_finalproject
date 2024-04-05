class CreateWatchedMedia < ActiveRecord::Migration[7.1]
  def change
    create_table :watched_media do |t|
      t.references :user, null: false, foreign_key: true
      t.references :media, null: false, foreign_key: true
      t.references :episode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
