class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :google_id
      t.string :title
      t.string :subtitle
      t.string :authors
      t.string :genres
      t.string :description
      t.string :language
      t.string :image_url
      t.datetime :published_date
      t.integer :page_count
      t.float :google_average_rating
      t.integer :rating_count

      t.timestamps
    end
  end
end
