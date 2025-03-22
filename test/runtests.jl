using DummyPusher
using Test

@testset "DummyPusher.jl" begin
    # Write your tests here.
end

@info "Running writer"
x = rand(1:10)
open("testfile", "w") do io
  println(io, x)
end
@info "done"
