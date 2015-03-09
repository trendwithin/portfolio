class Project < ActiveRecord::Base
  validates :name, presence: true, length: { in: 4..255}
  validates :technologies_used, presence: true
end
