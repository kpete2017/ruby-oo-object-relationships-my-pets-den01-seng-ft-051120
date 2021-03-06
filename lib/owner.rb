class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize name, species = 'human'
    @name = name
    @species = species
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

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end
  
  def buy_cat cat
    cat = Cat.new cat, self
  end

  def buy_dog dog
    dog = Dog.new dog, self
  end

  def walk_dogs
    dogs.map { |dog| dog.mood = 'happy' }
  end

  def feed_cats
    cats.map { |cat| cat.mood = 'happy' }
  end

  def sell_pets
    dogs.map do |dog| 
      dog.mood = 'nervous'
      dog.owner = nil 
    end
    cats.map do |cat| 
      cat.mood = 'nervous' 
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end