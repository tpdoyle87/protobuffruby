def encode(num)
  bytes = []
  while num > 0
    parts = num & 0x7f
    num >>= 7
    if num > 0
      parts |= 0x80
    end
    bytes << parts
  end
  return bytes
end

def decode(bytes)
  num = 0
  offset = 0
  while offset < bytes.length
    x = 0xff & bytes[offset]
    num |= x << offset
    offset += 7
  end
  return num
end

def hex_values(bytes)
  bytes.each { |num| print "0x#{num.to_s(16).rjust(2, '0')}" + " "}
end