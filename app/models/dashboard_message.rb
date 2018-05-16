class DashboardMessage < ApplicationRecord
  extend FriendlyId
  friendly_id :title, :use => [:slugged, :finders]
  
  has_attached_file :avatar, 
    styles: { medium: "300x300>", thumb: "100x100>", sz1: "390x450", small_thumb: "50x50" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :less_than => 5.megabytes

  scope :with_title_like, -> (q) { where('title LIKE ?', "%#{q}%") }
  scope :with_body_like, -> (q) { where('body LIKE ?', "%#{q}%") }

  def self.filter_and_sort(params)
    dashboard_messages = all
    if params[:term].present?
      dashboard_messages = dashboard_messages.with_title_like(params[:term]).or(dashboard_messages.with_body_like(params[:term]))
    end
    dashboard_messages
  end
  
  def s3_path(style = nil)
    avatar.s3_object(style).presigned_url("get", expires_in: 100) if avatar.exists?
  end
end
