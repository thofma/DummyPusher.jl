using DummyPusher
using Test

@testset "DummyPusher.jl" begin
    # Write your tests here.
end

devbranch = "main"

@info "Running writer"
@info "GITHUB_REF_TYPE" (ENV["GITHUB_REF_TYPE"])
@info "GITHUB_EVENT_NAME" (ENV["GITHUB_EVENT_NAME"])
@info "GITHUB_REF" (ENV["GITHUB_REF"])

pushdecision = false
pushdir = nothing

if ENV["GITHUB_REF_TYPE"] == "branch" && ENV["GITHUB_EVENT_NAME"] == "push" && ENV["GITHUB_REF"] == "refs/heads/$devbranch" 
  pushdecision = true
  pushdir = devbranch
end

if ENV["GITHUB_REF_TYPE"] == "tag" && ENV["GITHUB_EVENT_NAME"] == "push" && starswith(ENV["GITHUB_REF"] == "refs/tags/v")
  _, pushdir = split("ENV["GITHUB_REF"]", "refs/tags/")[2]
end

@info pushdecision, pushdir

x = rand(1:10)
path = "_tutorials/$devbranch"
mkpath(path)
open("$path/testfile", "w") do io
  println(io, x)
end
@info "done"
