class AI

  def do_turn(world)
    army_movement = Array.new
    for node in world.get_my_nodes
      dest = node.get_adjacents[Random.rand(node.get_adjacents.length)]
      move[:source] = node.get_source
      move[:destination] = dest
      move[:armyCount] = node.get_army_count / 2
      army_movement.push move
    end

    army_movement
  end

end