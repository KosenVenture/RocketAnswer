crumb :root do
  link "Home", root_path
end

crumb :universities do
  link "大学", universities_path
end

crumb :university do |university|
  link university.name, university_path(university)
  parent :universities
end

crumb :department do |department|
  link department.name, university_department_path(department.school.id, department)
  parent :university, department.school
end

crumb :subject do |subject|
  link subject.name, subject_path(subject)
  parent :department, subject.department
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).