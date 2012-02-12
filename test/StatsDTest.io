StatsDTest := UnitTest clone do(

  setUp := method(
    self stats := StatsD clone
    Socket asyncUdpWrite := method(address, value, start, end,
      self value := value
      self address := address
    )
  )

)
