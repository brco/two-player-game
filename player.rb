class Player

  attr_accessor :lives, :score, :name

  def initialize(name)
    @lives = 3
    @score = 0
    @name = name
  end

end