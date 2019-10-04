class AddDeletableToReadingLists < ActiveRecord::Migration[6.0]
  def change
    add_column :reading_lists, :deletable, :boolean, default: true
  end
end