class Entry < ActiveRecord::Base
  validates :title, presence: true
  validates :menu, presence: true
  validates :content, presence: true
  validates :entry_type, presence: true
  validates :url, presence: true
end