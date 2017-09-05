crumb :root do
  link "Home", root_path
end

crumb :universities do
  link "大学一覧", universities_path
end

crumb :university do |university|
  link university.name, university_path(university)
  parent :universities
end

crumb :department do |department|
  link department.name, university_department_path(department.school, department)
  parent :university, department.school
end

crumb :answer do |answer|
  link answer.name, answer_path(answer)
  parent :department, answer.department
end

crumb :exp_story do |exp_story|
  link exp_story.name, exp_story_path(exp_story)
  parent :department, exp_story.department
end
