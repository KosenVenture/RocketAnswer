class AddPrefectureAndAddressToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :prefecture, :string
    add_column :schools, :address, :string
  end
end
