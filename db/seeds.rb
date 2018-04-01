# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  QuestionTemplate.create(question_type: "salary_or_wage",multiple: true, question_text: "Did you earn salary or wage income during the year? Check your PAYG payment summaries (group certificates).")
  QuestionTemplate.create(question_type: "bank_interest",multiple: true, question_text: "Did you receive bank interest during the year? Contact your banks or check internet banking.")
  QuestionTemplate.create(question_type: "centre_link_payment", multiple: true, question_text: "Did you receive Centrelink payment during the year (Newstart Allowance, Parenting Payment, Austudy, Youth Allowance, Age Pension, etc)? Check payment summaries from Centerlink.")
  QuestionTemplate.create(question_type: "etp", multiple: true, question_text: 'Did you receive employment termination payment (ETP) during the year? Check your ETP PAYG payment summaries (group certificates).')
  QuestionTemplate.create(question_type: "superannuation", multiple: true, question_text: 'Did you receive superannuation lump sum or income stream during the year? Check superannuation PAYG payment summary (group certificates) from your superannuation fund.')
  QuestionTemplate.create(question_type: "share_dividends", multiple: true, question_text: "Did you receive share dividends during the year? Check dividend statements.")
  QuestionTemplate.create(question_type: "sell_any_shares", multiple: true, question_text: "Did you sell any shares during the year? Check share transaction statements or online trading.")
  QuestionTemplate.create(question_type: "managed_fund", question_text: "Did you have managed fund during the year? Check managed fund statements sent from your managed fund.")
  QuestionTemplate.create(question_type: "trust_or_partnership_distributions", question_text: "Did you have trust or partnership distributions during the year?")
  QuestionTemplate.create(question_type: "foreign_sourced", question_text: "Did you earn foreign sourced income during the year?")
  QuestionTemplate.create(question_type: "other_income", question_text: "Did you have any other income during the year?　")
  QuestionTemplate.create(question_type: "unsure", question_text: "Unsure? Please leave a message.")
  puts 'Question template has been populated'
