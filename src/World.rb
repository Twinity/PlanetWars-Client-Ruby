class World

  def initialize
    @my_nodes = Array.new
    @all_nodes = Array.new
    @opponent_nodes = Array.new
    @free_nodes = Array.new
    @total_turns = 0
    @current_turn = 0
    @my_id = 1
    @opponent_id = 2
    @neutral_id = 0
  end

  def get_my_nodes
    @my_nodes
  end

  def get_all_nodes
    @all_nodes
  end

  def get_opponent_nodes
    @opponent_nodes
  end

  def free_nodes
    @free_nodes
  end

  def get_total_turns
    @total_turns
  end

  def get_current_turn
    @current_turn
  end

  def get_my_id
    @my_id
  end

  def get_opponent_id
    @opponent_id
  end

  def get_neutral_id
    @neutral_id
  end
  
end