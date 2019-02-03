# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TestDetail.create(name: "Prelim Exam", test_type: "EXAM", description: "Preliminary Exam")
TestDetail.create(name: "Midterm Exam", test_type: "EXAM", description: "Midterm Exam")
TestDetail.create(name: "Semi-final Exam", test_type: "EXAM", description: "Semi-final Exam")
TestDetail.create(name: "Final Exam", test_type: "EXAM", description: "Final Exam")

TestDetail.create(name: "Quiz", test_type: "NORMAL", description: "Quiz")
TestDetail.create(name: "Casestudy", test_type: "NORMAL", description: "Casestudy")
TestDetail.create(name: "Reporting", test_type: "NORMAL", description: "Reporting")
TestDetail.create(name: "Seat Work", test_type: "NORMAL", description: "Seat Work")
TestDetail.create(name: "Recitation",test_type: "NORMAL", description: "Recitation")

User.create(username: 'admin', password: 'admin', user_type: 'ADMIN', first_name: 'admin', last_name: '', middle_name: '', email: 'admin@cs.com', address: 'admin', gender: 'male', birthday: Date.new)