CHUNK_SIZE   = 1024 * 1024
DEFAULT_FILE = 'default.jpg'.freeze

# Calculates and prints ones and zeros of a provided local file
class FileBitCounter
  def initialize(file_path = DEFAULT_FILE)
    raise 'File provided does not exist' unless File.file?(file_path)

    @file_path   = file_path
    @offset      = 0
    @total_zeros = 0
    @total_ones  = 0
  end

  def count_bits
    until (chunk = offset_binary).nil?
      unpack_as_bits(chunk)

      @offset += CHUNK_SIZE
    end

    [@total_zeros, @total_ones]
  end

  def print_results
    puts "Counting bits of #{@file_path}..."

    zeros, ones = count_bits

    puts "Found #{zeros} bits set to 0"
    puts "Found #{ones} bits set to 1"
  end

  private

  def unpack_as_bits(content)
    content.unpack('b*').each { |str| calculate_ones_and_zeros(str) }
  end

  def calculate_ones_and_zeros(str)
    @total_zeros += str.count('0')
    @total_ones  += str.count('1')
  end

  def offset_binary
    IO.binread(@file_path, CHUNK_SIZE, @offset)
  end
end
