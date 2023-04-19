@testset "viewgroup.jl" begin
    using DataFrames
    v = randn(5)
    v[2] = NaN
    v[3] = NaN
    df1 = DataFrame(
        :a => [1,   2,    3,     1,    2],
        :b => v, #  NaN,  NaN
        :c => ["A", "A", missing, "B", missing],
    )
    df2 = DataFrame(
        :a => [1,   2,    3,     1,    2],
        :b => v, #  NaN,  NaN
        :c => ["A", "A", missing, "B", NaN],
    )

    dropnanmissing!(df1)
    dropnanmissing!(df2)
    @test df1 !== df2
    @test nrow(df1) == 2
    @test nrow(df2) == 2
    @test df1 == df2
end
