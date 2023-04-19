@testset "viewgroup.jl" begin
    using DataFrames
    df = DataFrame(
        :a => [1, 2, 3, 1, 2],
        :b => randn(5),
        :c => ["A", "A", "B", "B", "C"],
    )
    dfv = viewgroup(df; a = 1)
    @test isequal(dfv.a, [1, 1])
    @test isequal(dfv.c, ["A", "B"])
    df.c[5] = "D"
    dfv2 = viewgroup(df; a = 2)
    @test isequal(dfv2.c[end], "D") # test it is viewed


    dfv3 = viewgroup(df; a = 3, c = "B")
    @test isequal(only(dfv3.a), 3)
    @test isequal(only(dfv3.c), "B")
end
