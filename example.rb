require 'irb'

filename = "../jobs.txt"

# count file's line
lines_count = `wc -l #{filename}`.strip[/^\d+/].to_i

# max of 80%
read_limit = lines_count * 8 / 10

# open file
File.open(filename) do |f|
  f.each_line.lazy.each_with_index do |line, idx|
    next if idx.zero?
    # do something amazin with `line`
  end.first(read_limit)
end
