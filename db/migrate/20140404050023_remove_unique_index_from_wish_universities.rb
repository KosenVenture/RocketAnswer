class RemoveUniqueIndexFromWishUniversities < ActiveRecord::Migration
  def change
    remove_index :wish_universities, name: :wish_universities_uniquness
  end
end
