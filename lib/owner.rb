require 'pry'

class Owner
  attr_reader :name, :species
  @@all = []

  def initialize name
    @name = name
    @species = "human"
    @@all << self
    @cats = []
    @dogs = []
  end

  def say_species 
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    @cats
  end

  def dogs 
    @dogs
  end

  def buy_cat name
    Cat.new(name, self)
  end
  
  def buy_dog name
    Dog.new(name, self)
  end

  def change_mood pet, newMood
    pet.each do |animal|
      animal.mood = newMood
    end
  end

  def walk_dogs
    self.change_mood @dogs, 'happy'
  end

  def feed_cats
    self.change_mood @cats, 'happy'
  end

  def sell_pets
    @dogs.each do |dog|
      dog.owner = nil
      dog.mood = 'nervous'
    end
    @cats.each do |cat|
      cat.owner = nil
      cat.mood = 'nervous'
    end
    @dogs.clear
    @cats.clear
  end

  def list_pets
    "I have #{@dogs.count} dog(s), and #{@cats.count} cat(s)."
  end

end