StatsDDefaultTest := StatsDTest clone do(

  testDefaultIp := method(
    self stats count("hello", 10)
    assertEquals(StatsD ip, Socket address ip)
  )

  testDefaultPort := method(
    self stats count("hello", 10)
    assertEquals(StatsD port, Socket address port)
  )

  testCount := method(
    self stats count("hello", 10)
    assertEquals("hello:10|c", Socket value)
  )

  testIncrement := method(
    self stats increment("hello")
    assertEquals("hello:1|c", Socket value)
  )

  testDecrement := method(
    self stats decrement("hello")
    assertEquals("hello:-1|c", Socket value)
  )

  testTime := method(
    self stats time("hello", 10)
    assertEquals("hello:10|ms", Socket value)
  )

  testCountRate := method(
    self stats count("hello", 10, 0.2)
    assertEquals("hello:10|c|@0.2", Socket value)
  )

  testTimeRate := method(
    self stats time("hello", 10, 0.2)
    assertEquals("hello:10|ms|@0.2", Socket value)
  )

)
