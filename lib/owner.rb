require 'pry'

class Owner
  attr_reader :name, :species
  @@all = []

    def initialize(name)
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

    def buy_cat(cat_name)
      new_cat = Cat.new(cat_name, self)
    end

    def buy_dog(dog_name)
      new_dog = Dog.new(dog_name, self)
    end

    def walk_dogs
      Dog.all.map {|dog_instance| dog_instance.mood = "happy"}
    end

    def feed_cats
      Cat.all.map {|cat_instance| cat_instance.mood = "happy"}
    end

    def cats_and_dogs
      self.cats.concat(self.dogs)
    end

    def sell_pets
      cats_and_dogs.map do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
      self.cats.clear
      self.dogs.clear
    end

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end

end
