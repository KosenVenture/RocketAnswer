nnct = TechnicalCollege.create(
  establishment: '国立',
  name: '長野工業高等専門学校'
)
nnct.departments.create([
  {
    name: '機械工学科',
    kind: '機械系',
    prefecture: '長野県'
  },
  {
    name: '電気電子工学科',
    kind: '電気・電子系',
    prefecture: '長野県'
  },
  {
    name: '電子制御工学科',
    kind: '機械・電気系',
    prefecture: '長野県'
  },
  {
    name: '環境都市工学科',
    kind: '土木・建築系',
    prefecture: '長野県'
  }
])
j = nnct.departments.create(
  name: '電子情報工学科',
  kind: '情報系',
  prefecture: '長野県'
)

User.create(
  school_id: nnct.id,
  department_id: j.id,
  name: '長野　高専',
  nickname: 'こうせん',
  email: 'nnct@example.com',
  graduate_year: 2010
)

univs = University.create([
  { establishment: '国立', name: '東京工業大学' },
  { establishment: '国立', name: '東京大学' }
])

tsukuba = University.create(
  establishment: '国立',
  name: '筑波大学'
)
math = tsukuba.departments.create(
  name: '理工学群数学類',
  kind: '数学系',
  prefecture: '茨城県'
)
math.subjects.create([
  { name: '数学' },
  { name: '英語' }
])