require 'benchmark'

def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))

Benchmark.bm do |x|
  # sequential version
  x.report('seq call'){ 2.times{ tarai(14, 7, 0) } }

  # parallel version
  x.report('par (Ractor)'){
    2.times.map do
    Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
  