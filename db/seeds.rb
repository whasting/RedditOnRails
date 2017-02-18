# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create!(email: 'Justin', password: 'justin')
u2 = User.create!(email: 'Wade', password: 'password')
u3 = User.create!(email: 'Bob', password: 'password')

s1 = Sub.create!(title: 'SCIENCE!', description: 'sciency stuff', user_id: u1.id)
s2 = Sub.create!(title: 'Succulents', description: 'alien plant invaders', user_id: u2.id)
s3 = Sub.create!(title: 'Deserts', description: 'sandy', user_id: u2.id)


p1 = Post.create!(title: 'bs1', url: 'hweaje_1', content: '1', sub_id: s1.id, user_id: u1.id)
p2 = Post.create!(title: 'bs2', url: 'hweaje_2', content: '2', sub_id: s1.id, user_id: u2.id)
p3 = Post.create!(title: 'bs3', url: 'hweaje_3', content: '3', sub_id: s2.id, user_id: u2.id)

PostSub.create!(sub_id: s2.id, post_id: p1.id)
PostSub.create!(sub_id: s3.id, post_id: p1.id)

PostSub.create!(sub_id: s1.id, post_id: p3.id)
