class Member < ActiveRecord::Base
  before_validation :initialize_preferences, on: :create
  
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

  def region_names 
    region.map { |region_id| Region.find_by_id(region_id).try(:name) }.compact
  end


  # using store_accessor is a much better way to have these getter/setter methods
  # - but this is fun to do if it ever makes sense :)
  #metaprogramming madness!!
  #define methods to easily check to see if a user has a given preference in their json object
  # PREFERENCES.each do |preference|
  #   define_method("prefers_#{preference}?") do |preference_type|

  #     if preferences["#{preference}"] && preferences["#{preference}"].include?("#{preference_type}")
  #       return true
  #     else
  #       return false
  #     end
  #   end
  # end

end
