# Bit Counter Case

A simple way to display number of zeros and ones of a local file.

## How to

Open irb:

```
irb -r ./file_bit_counter.rb
```

Run count_bits, providing the path to the file you want to examine:

```
FileBitCounter.new(file_path).print_results
```