class Song < ApplicationRecord
  belongs_to :artist
  has_many :tags
  has_one :external_links_list
end
