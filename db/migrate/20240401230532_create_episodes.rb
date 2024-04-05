class CreateEpisodes < ActiveRecord::Migration[7.1]
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :description
      t.integer :season_number
      t.integer :episode_number
      t.references :media, null: false, foreign_key: true

      t.timestamps
    end
  end
end
