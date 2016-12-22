require 'rspec'
require_relative 'day7'


describe 'supports_tls?' do

  it 'returns true if ABBA exists outside of brackets' do
    ip = IPAddress.new('abba[mnop]qrst')
    expect(ip.supports_tls).to eq(true)
  end

  it 'returns true for IP for ABBA in longer string' do
    ip = IPAddress.new('ioxxoj[asdfgh]zxcvbn')
    expect(ip.supports_tls).to eq(true)
  end

  it 'returns false if the sole ABBA exists inside of brackets' do
    ip = IPAddress.new('axbf[mnnm]qrst')
    expect(ip.supports_tls).to eq(false)
  end

  it 'returns false if any ABBA exists inside of brackets' do
    ip = IPAddress.new('abcd[bddb]xyyx')
    expect(ip.supports_tls).to eq(false)
  end

  it 'returns false if any ABBA exists inside of any set of brackets' do
    ip = IPAddress.new('abcd[bvol]xyyx[erre]papwe')
    expect(ip.supports_tls).to eq(false)
  end

  it 'returns false if IP has no ABBA' do
    ip = IPAddress.new('abcd[bdce]xzyp')
    expect(ip.supports_tls).to eq(false)
  end

  it 'returns false if for sequence of 4 identical characters' do
    ip = IPAddress.new('aaaa[qwer]tyui')
    expect(ip.supports_tls).to eq(false)
  end

end
