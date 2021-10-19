class Post < ApplicationRecord
    has_one_attached :image
    paginates_per 10

    scope :active, -> { where(active: true) }

    scope :latest, -> { order created_at: :desc }
end
