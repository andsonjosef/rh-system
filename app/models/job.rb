class Job < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :local, presence: true
    validates :salary, presence: true
    validates :employment_type, presence: true
    validates :status, presence: true
end
