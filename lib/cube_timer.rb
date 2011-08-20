require 'puzzled'

class CubeTimer
  attr_accessor :cube, :average, :times

  def initialize
    @cube = Puzzled::RubiksCube.new
    @times = []
    @average = 0
  end

  def play
    while true
      new_round
    end
  end

  private 

  def new_round
    print_line
    print_stats
    print_scramble
    save_time time_solve
    update_average
  end

  def print_line
    puts "\n-----------------------------------------\n\n"
  end

  def print_stats
    puts "Average: #{(@average*100).round.to_f / 100} seconds"
  end

  def print_scramble
    @cube.scramble.each do |move|
      print move + " "
    end
    puts
  end

  def time_solve
    print "\npress <enter> to START timer..."
    gets
    start_time = Time.now
    print "press <enter> to STOP timer..."
    gets
    stop_time = Time.now
    solve_time = stop_time - start_time
  end

  def save_time(time)
    @times << time
  end

  def update_average
    sum = 0
    @times.each do |time|
      sum = sum + time
    end
    @average = sum / @times.size
  end
end
