class Waiter
 
  attr_accessor :name, :yrs_experience
 
  @@all = []
 
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end
 
  def self.all
    @@all
  end
  
   def new_meal(customer,total,tip)
    Meal.new(self,customer,total,tip)
  end
 
 def meals
    Meal.all.select {|meal| meal.waiter == self}
  end
  
  def highest_tip
    meals.collect {|meal| meal.tip}.max  
  end
  
  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
    meal_a.tip <=> meal_b.tip
  end
    best_tipped_meal.customer
  end
  
  def worst_tipper_meal
    worst_tipped_meal = meals.min do |meal_a, meal_b|
    meal_a.tip <=> meal_b.tip
    end
  
  end
  
  
  
  
  
  
 #> def best_tipper
  #  highest_paid_meal = meals.select{|meal|  meal.tip == highest_tip}
    
 #   highest_paid_meal.customer
    
#  end
  
 
end