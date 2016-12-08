require 'rspec'
require_relative 'day7'

describe 'supports_tls?' do 
  it 'returns true if ABBA exists outside of brackets' do
    expect(supports_tls?('abba[mnop]qrst')).to eq(true)
  end

  it 'returns true for IP for ABBA in longer string' do 
    expect(supports_tls?('ioxxoj[asdfgh]zxcvbn')).to eq(true)
  end

  it 'returns false if the sole ABBA exists inside of brackets' do
    expect(supports_tls?('axbf[mnnm]qrst')).to eq(false)
  end

  it 'returns false if any ABBA exists inside of brackets' do
    expect(supports_tls?('abcd[bddb]xyyx')).to eq(false)
  end

  it 'returns false if IP has no ABBA' do
    expect(supports_tls?('abcd[bdce]xzyp')).to eq(false)
  end

  it 'returns false if for sequence of 4 identical characters' do
    expect(supports_tls?('aaaa[qwer]tyui')).to eq(false)
  end

end
