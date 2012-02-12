# An IO client for interacting with StatsD
# @author John Crepezzi <john.crepezzi@gmail.com>
StatsD := Object clone

# The IP to send stats to
StatsD ip := "127.0.0.1"

# The port to send stats to
StatsD port := 8125

# An optional prefix to include in keys
StatsD prefix := nil

# Record a time in milliseconds
StatsD time := method(key, time, rate,
  send("#{key}:#{time}|ms" interpolate, rate)
)

# Record a count
StatsD count := method(key, amount, rate,
	send("#{key}:#{amount}|c" interpolate, rate)
)

# Send value to StatsD, adding the optional
# prefix and rate
StatsD send := method(value, rate,
	if(self prefix isNil not, value = "#{self prefix}#{value}" interpolate)
	if(rate isNil not, value = "#{value}|@#{rate}" interpolate)
  address := IPAddress clone setIp(ip) setPort(port)
  Socket asyncUdpWrite(address, value, 0, value size)
  self
)
