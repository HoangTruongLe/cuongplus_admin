class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|
      t.references :user
      t.boolean :salary_or_wage, default: true
      t.boolean :bank_interest, default: true
      t.boolean :centre_link_payment, default: false
      t.boolean :etp, default: false
      t.boolean :superannuation, default: false
      t.boolean :share_dividends, default: false
      t.boolean :sell_any_shares, default: false
      t.boolean :managed_fund, default: false
      t.boolean :trust_or_partnership_distributions, default: false
      t.boolean :foreign_sourced, default: false
      t.boolean :other_income, default: false
      t.boolean :unsure, default: false
      t.string :number_employer

      t.timestamps
    end
  end
end
