class Board
  attr_accessor :cups
  VALID_MOVES = [1,2,3,4,5,7,8,9,10,11,12,14]
  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      4.times do cup << :stone unless idx == 6 || idx == 13
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless VALID_MOVES.include?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    removed_stones = cups[start_pos].length
    dis_count = start_pos
    removed_stones.times do |stone|
      (dis_count += 1) % 14
      cups[dis_count] << :stone
    end
    cups[start_pos] = []
    render
  end

  def next_turn(ending_cup_idx)
  # helper method to determine what #make_move returns
  if ending_cup_idx == 6 || ending_cup_idx == 13
    # ended on store -- get to choose where to start again
    :prompt
  elsif @cups[ending_cup_idx].count == 1
    # ended on empty cup -- switches players' turns
    :switch
  else
    # ended on cup with stones in it -- automatically starts there
    ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if cups[0..5].all? { |cup| cup.empty? }
    return true if cups[7..12].all? { |cup| cup.empty? }
    false
  end

  # def winner
  #   player_one = cups[6].count
  #   player_two = cups[13].count
  #
  #   if player_one == player_two
  #     return "DRAW!"
  #   elsif player_one > player_two
  #     return player_one.name
  #   elsif player_two > player_one
  #     return player_two.name
  #   end
  # end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      :draw
    else
      player1_count > player2_count ? @name1 : @name2
    end
  end
end
