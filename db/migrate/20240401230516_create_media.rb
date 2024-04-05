class CreateMedia < ActiveRecord::Migration[7.1]
  def change
    create_table :media do |t|
      t.string :title
      t.text :description
      t.string :media_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
