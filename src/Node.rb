class Node

  def initialize
    @id = 0
    @army_count = 0
    @owner = 0
    @adjacents = Array.new
  end

  def get_id
    @id
  end

  def get_army_count
    @army_count
  end

  def get_owner
    @owner
  end

  def get_adjacents
    @adjacents
  end

end