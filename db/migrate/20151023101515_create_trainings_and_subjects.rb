class CreateTrainingsAndSubjects < ActiveRecord::Migration

  #use has_and_belongs_to_many, since we don't need to work with
  # the trainings_subjects as a separate entity, or save data there.
  def change
    create_table :trainings do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :subjects do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :trainings_subjects, id: false do |t|
      t.belongs_to :training, index: true
      t.belongs_to :subject, index: true 
    end
  end
end
