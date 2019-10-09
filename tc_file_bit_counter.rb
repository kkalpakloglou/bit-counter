require_relative 'file_bit_counter'
require "minitest/autorun"

class TestFileBitCounter < Minitest::Test

  def test_invalid_file_provided
    assert_raises( RuntimeError ) { FileBitCounter.new('random-file') }
  end

  def test_count_bits_results_format
    zeros, ones = FileBitCounter.new.count_bits

    assert_instance_of Integer, zeros
    assert_instance_of Integer, ones
  end

  def test_print_results_output
    file_bit_counter = FileBitCounter.new

    file_bit_counter.stub(:count_bits, [10, 12]) do
      assert_output(/Counting bits of/) { file_bit_counter.print_results }
    end
  end
end