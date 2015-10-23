class Member < ActiveRecord::Base
  before_create :initialize_preferences
  
  store_accessor :preferences, ["subject", "region", "price", "start_date"]
  
  validates :email, presence: true

  #set list of preferences to be stored
  PREFERENCES = ["subject", "region", "price", "start_date"]

  def initialize_preferences 
    self.preferences = Hash[ PREFERENCES.map { |preference| [preference, []] }]
  end

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
