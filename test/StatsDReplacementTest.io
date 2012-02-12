StatsDReplacementTest := StatsDTest clone do(

  replacementIp := "123.45.67.89"
  replacementPort := 9100

  setUp := method(
    super(setUp)
    self stats ip = replacementIp
    self stats port = replacementPort
  )

  testReplacementIp := method(
    self stats count("hello", 10)
    assertEquals(self replacementIp, Socket address ip)
  )

  testReplacementPort := method(
    self stats count("hello", 10)
    assertEquals(self replacementPort, Socket address port)
  )

)
