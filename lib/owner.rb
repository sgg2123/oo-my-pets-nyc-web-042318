require 'pry'
require 'cat'
require 'dog'
require 'fish'

class Owner
  ALL = []
  attr_accessor :name, :pets
  attr_reader :species
  def initialize(species)
    @species = species
    @name = name
    @pets = {:fishes=>[], :dogs=>[], :cats=>[]}
    ALL << self
  end

  def self.all
    ALL
  end

  def self.reset_all
    while !ALL.empty?
      ALL.pop
    end
  end

  def self.count
    ALL.length
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    @pets[:fishes] << new_fish
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    @pets[:dogs] << new_dog
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @pets[:cats] << new_cat
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |k, v|
      v.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets = {:fishes=>[], :dogs=>[], :cats=>[]}
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end


end
