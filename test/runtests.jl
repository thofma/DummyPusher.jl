using DummyPusher
using Test

@testset "DummyPusher.jl" begin
    # Write your tests here.
end

@info "Running writer"
@info "GITHUB_REF_TYPE" (ENV["GITHUB_REF_TYPE"])
@info "GITHUB_EVENT_NAME" (ENV["GITHUB_EVENT_NAME"])
@info "GITHUB_REF" (ENV["GITHUB_REF"])

x = rand(1:10)
open("testfile", "w") do io
  println(io, x)
end
@info "done"
