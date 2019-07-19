class Owner
  @@all = []
  attr_accessor :cats, :dogs
  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    @@all << self
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

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy" }
  end

  def sell_pets
    self.cats.each {|cat| cat.mood = "nervous"; cat.owner = nil }
    self.dogs.each {|dog| dog.mood = "nervous"; dog.owner = nil }
    self.cats = []
    self.dogs = []
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end