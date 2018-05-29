require "benchmark"
require "csv"
require "arrow"

[1, 2, 4, 8, 16].each do |i|
  iris = File.read("iris.csv")
  csv = "iris#{i}.csv"
  arrow = "iris#{i}.arrow"
  parquet = "iris#{i}.parquet"
  File.open(csv, "w") do |output|
    i.times do
      output.puts(iris)
    end
  end

  n_lines = iris.lines.size * i

  time_csv = Benchmark.measure do
    CSV.read(csv)
  end

  Arrow::Table.load(csv).save(arrow)
  Arrow::Table.load(arrow)

  time_arrow = Benchmark.measure do
    Arrow::Table.load(arrow)
  end

  Arrow::Table.load(csv).save(parquet)
  Arrow::Table.load(parquet)

  time_parquet = Benchmark.measure do
    Arrow::Table.load(parquet)
  end

  puts([
         n_lines,
         time_csv.real,
         time_arrow.real,
         time_parquet.real,
       ].join("\t"))
end
