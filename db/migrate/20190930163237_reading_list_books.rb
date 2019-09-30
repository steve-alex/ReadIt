class ReadingListBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :reading_list_books do |t|
      t.integer :book_id
      t.integer :reading_list_id
    end
  end
end
