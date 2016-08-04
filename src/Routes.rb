require_relative './Req'
require 'json'

class Routes

  def initialize(server)
    @server_port = 4000
    @server = server
  end

  def get_server_state
    loop do
      url = "http://localhost:#{@server_port}/serverdata"
      http = Req::Get.new
      data = http.get(url).as_json.headers('X-Request-ID' => server.get_my_id).exec.body
      if data == 'wait'
        sleep 1000
      end

      break if data != 'wait'
    end
    world = JSON.parse data
  end

  def send_state(army_movement)
    url = "http://localhost:#{@server_port}/clientdata"
    http = Req::Post.new
    response = http
                   .post(url)
                   .as_json
                   .headers('X-Reqiest-ID' => server.get_my_id)
                   .set_body(army_movement)
                   .exec
                   .body
  end

  def get_id_from_server
    url = "http://localhost:#{@server_port}/getid"
    http = Req::Get.new
    response = http.get(url).exec.body
  end

end