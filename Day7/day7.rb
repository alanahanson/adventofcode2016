class IPAddress
  attr_reader :hypernets, :sequences

  def initialize(address)
    @sequences = address.gsub(/\[.*\]/, ',').split(',')
    @hypernets = address.scan(/\[\w+\]/)
  end

  def supports_tls
    hypernets.none? {|h| matches_pattern(h)} && sequences.any? {|s| matches_pattern(s)}
  end

  private

  def is_abba(s)
    s[0] == s[3] && s[1] == s[2] && s[0] != s[1]
  end

  def matches_pattern(sequence)
    return false if sequence.length < 4
    i = 0
    while i + 3 < sequence.length
      return true if is_abba(sequence[i..i+3])
      i += 1
    end
    return false
  end
end

class IPChecker
  attr_reader :addresses

  def initialize(filename)
    @addresses = IO.readlines(filename).map {|a| IPAddress.new(a.chomp)}
  end

  def tls_supportive_ip_count
    addresses.count {|a| a.supports_tls}
  end
end

checker = IPChecker.new('Day7/input.txt')
p checker.tls_supportive_ip_count

