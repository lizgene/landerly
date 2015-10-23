class Training < ActiveRecord::Base
  has_and_belongs_to_many :subjects,  :join_table => :trainings_subjects
end
