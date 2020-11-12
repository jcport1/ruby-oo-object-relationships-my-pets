require 'pry'

#owner can have many dogs & many cats 

class Owner
  # code goes here
  attr_reader :name 

  @@all = []
  # @@pets = []

  def initialize(name, species = "human") #set default species to human

    @name = name
    @species = species #must also have instance variable for object
    @@all << self 
   
  end 

def species
  @species
end 

def say_species

  "I am a #{@species}." 

end 

def self.all

  @@all 

end 

def self.count

  @@all.size 

end 

def self.reset_all

  @@all = []

end 

def cats 

  Cat.all.select do |cat|
    cat.owner == self
  end 
end 

  def dogs
    
    Dog.all.select do |dog|
      dog.owner == self
    end 

  end 

  def buy_cat(cat_object)

   

    #since the cat_object argument is a string
    #you must instantiate a new object
    # and then set the owner = self 

    Cat.new(cat_object,self)

  end 

  def buy_dog(dog_object)

    Dog.new(dog_object,self)

  end 

  def walk_dogs

    self.dogs.each do |dog|

      dog.mood = "happy"

    end 
  end 

  def feed_cats

    self.cats.each do |cat_object|
      cat_object.mood = "happy"
    end 
  end 

  def sell_pets

    #pro tip you can combine two arrays together, save it to a variable, and then iterate on the variable 
    pets = self.dogs + self.cats
    pets.each do |pet|
      pet.owner = nil
      pet.mood = "nervous"  
    end 
  end 

  def list_pets

    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."

  end 

end