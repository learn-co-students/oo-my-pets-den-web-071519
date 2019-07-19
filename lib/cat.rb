class Cat
  @@all = []
  attr_accessor :mood, :owner, :mood
  attr_reader :name
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    owner.cats << self
    @@all << self
  end

  def self.all
    @@all
  end
end