class Owner
  attr_reader :name, :species

  @@all =[]

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self  
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    owned_pets = self.cats + self.dogs
    owned_pets.each {|pet| sell_pet(pet)}
  end

  def sell_pet(pet)
    pet.owner = nil
    pet.mood = "nervous"
  end

  def list_pets
    number_of_dogs = self.dogs.count
    number_of_cats = self.cats.count
    "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
  end
  
  def self.reset_all
    self.all.clear
  end

end