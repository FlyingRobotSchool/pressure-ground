require 'serialport'
require 'expect'

PROMPT = ">\s"

def talk(string)
  @sp.puts string
  reply = @sp.expect(/#{PROMPT}/)[0].split("\r\n")[1...-1]
  return reply.size == 1 ? reply[0] : reply
end

@sp = SerialPort.new "/dev/tty.usbserial-A603KH4R", 57600, 8, 1, SerialPort::NONE
# puts talk("print timer1")
puts talk("pressure")
@sp.close
