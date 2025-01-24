class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :status, presence: true
  validates :is_admin, presence: true

  enum :status, { draft: "draft", published: "published", archived: "archived" }
  enum :is_admin, { admin: true, general: false }

  scope :admin_draft, -> { admin.draft }

  def admin_draft?
    admin? && draft?
  end
end
