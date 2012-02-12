StatsDPrefixTest := StatsDTest clone do(

	prefix := "word."

	setUp := method(
		super(setUp)
		self stats prefix = self prefix
	)

	testCount := method(
		self stats count("hello", 10)
		assertEquals(prefix .. "hello:10|c", Socket value)
	)

	testTime := method(
		self stats time("hello", 10)
		assertEquals(prefix .. "hello:10|ms", Socket value)
	)

)
