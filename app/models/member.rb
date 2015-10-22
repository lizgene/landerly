class Member < ActiveRecord::Base
  validates :email, presence: true

  PREFERENCES = ["subjects", "region", "start_date", "price"]

  def full_name
    "#{first_name} #{last_name}"
  end


  #metaprogramming madness!!
  #define methods to easily check to see if a user has a given preference in their json object
  PREFERENCES.each do |preference|
    define_method("prefers_#{preference}?") do |preference_type|

      if preferences["#{preference}"] && preferences["#{preference}"].include?("#{preference_type}")
        return true
      else
        return false
      end
    end
  end

end
