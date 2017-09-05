class AddPrefectureAndAddressToSchools < ActiveRecord::Migration[5.1]
  def change
    add_column :schools, :prefecture, :string
    add_column :schools, :address, :string
  end
end
