class IPAddress
  attr_reader :hypernet, :sequences

  def initialize(address)
    @sequences = address.partition(/\[.*\]/)
    @hypernet = sequences[1]
  end

  def supports_tls
    puts sequences
    # some strings have more than one hypernet!
    return false if matches_pattern(hypernet)
    matches_pattern(sequences[0]) || matches_pattern(sequences[2])
  end

  private

  def is_abba(s)
    s[0] == s[3] && s[1] == s[2] && !(s[0] == s[1])
  end

  def matches_pattern(s)
    s.chars.each_index do |i|
      return true if is_abba(s[i..i+3])
    end
    return false
  end
end

class IPChecker
  attr_reader :addresses

  def initialize(filename)
    @addresses = IO.readlines(filename).map {|a| IPAddress.new(a)}
  end

  def tls_supportive_ip_count
    addresses.count {|a| p a.supports_tls}
  end
end

checker = IPChecker.new('Day7/input.txt')
p checker.tls_supportive_ip_count

