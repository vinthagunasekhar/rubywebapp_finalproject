class AddFieldsToMedia < ActiveRecord::Migration[7.1]
  def change
    add_column :media, :ott, :string
    add_column :media, :total_seasons, :integer
    add_column :media, :seasons_watched, :integer
  end
end
