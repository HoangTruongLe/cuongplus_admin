module ScopingConcern
  extend ActiveSupport::Concern
  included do
    default_scope { where(draft: false) }
  end
end
