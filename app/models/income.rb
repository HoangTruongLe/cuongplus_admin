class Income < ApplicationRecord
  has_many :extra_questions, :dependent => :destroy
  accepts_nested_attributes_for :extra_questions, reject_if: :all_blank, allow_destroy: true
  has_many :upload_files, as: :fileable, :dependent => :destroy
  accepts_nested_attributes_for :upload_files, reject_if: :all_blank, allow_destroy: true

  belongs_to :user


  ANSWERS = [[true, 'Yes'] ,[:false, 'No']]

  validates_presence_of :number_employer, on: [:update], :if => Proc.new { |income| income.salary_or_wage }
  validates_numericality_of :number_employer, on: [:update]
end
