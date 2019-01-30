# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TestDetail.create(name: "Prelim Exam", description: "Preliminary Exam")
TestDetail.create(name: "Midterm Exam", description: "Midterm Exam")
TestDetail.create(name: "Semi-final Exam", description: "Semi-final Exam")
TestDetail.create(name: "Final Exam", description: "Final Exam")

TestDetail.create(name: "Quiz", description: "Quiz")
TestDetail.create(name: "Casestudy", description: "Casestudy")
TestDetail.create(name: "Reporting", description: "Reporting")
TestDetail.create(name: "Seat Work", description: "Seat Work")
TestDetail.create(name: "Recitation", description: "Recitation")

