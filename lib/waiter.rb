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
  
  def highest_paid_meal
    meals.select{|meal|  meal.tip == highest_tip}.customer
  end
  
  def best_tipper
    meals.select{|meal|  meal.tip == highest_tip}.customer
    
    
  end
  
 
end