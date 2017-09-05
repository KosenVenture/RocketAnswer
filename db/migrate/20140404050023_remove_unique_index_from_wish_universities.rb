class RemoveUniqueIndexFromWishUniversities < ActiveRecord::Migration[5.1]
  def change
    remove_index :wish_universities, name: :wish_universities_uniquness
  end
end
