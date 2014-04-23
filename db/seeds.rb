require 'csv'

# 初期管理ユーザ
AdminUser.create(
  email: 'admin@example.com',
  password: 'password', password_confirmation: 'password'
  )

school_list_path = Rails.root.join('config', 'schools.csv')
department_list_path = Rails.root.join('config', 'departments.csv')

CSV.table(school_list_path).each do |row|
  University.create(row.to_h)
end

CSV.table(department_list_path).each do |row|
  Department.create(row.to_h)
end

