class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates :email, :first_name, :last_name, presence: true
  enum role: [:super_user, :normal_user]

  scope :with_first_name_like, -> (q) { where('first_name LIKE ?', "%#{q}%") }
  scope :with_last_name_like, -> (q) { where('last_name LIKE ?', "%#{q}%") }
  scope :with_email_like, -> (q) { where('email LIKE ?', "%#{q}%") }

  has_one :profile
  has_one :income
  
  def self.filter_and_sort(params)
    users = all
    if params[:term].present?
      users = users.with_first_name_like(params[:term]).or(users.with_last_name_like(params[:term])).or(users.with_email_like(params[:term]))
    end
    users
  end

  roles.each do |r|
    define_method "#{r}?" do
      role == r
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def super_user?
    self.role == 'super_user'
  end
end
