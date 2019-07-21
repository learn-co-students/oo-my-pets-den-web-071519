require 'pry'

class Owner
  attr_reader :name, :species, :cats, :dogs

  @@all = []

  def self.all
    @@all
  end

  def initialize name
    @name = name
    @species = "human"
    Owner.all << self
    @cats = []
    @dogs = []
  end 

  def say_species
    p "I am a #{@species}."
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    @dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    @cats.map {|cat| cat.mood = "happy"}
  end

  def sell_pets
    @cats.map {|cat| cat.mood = "nervous"}
    @cats.map {|cat| cat.owner = nil}
    @cats.clear
    @dogs.map {|dog| dog.mood = "nervous"}
    @dogs.map {|dog| dog.owner = nil}
    @dogs.clear
  end

  def list_pets
    p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end