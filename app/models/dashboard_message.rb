class DashboardMessage < ApplicationRecord
  scope :with_title_like, -> (q) { where('title LIKE ?', "%#{q}%") }
  scope :with_body_like, -> (q) { where('body LIKE ?', "%#{q}%") }

  def self.filter_and_sort(params)
    dashboard_messages = all
    if params[:term].present?
      dashboard_messages = dashboard_messages.with_title_like(params[:term]).or(dashboard_messages.with_body_like(params[:term]))
    end
    dashboard_messages
  end
end
