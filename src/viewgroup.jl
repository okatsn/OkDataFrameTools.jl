function viewgroup(df::DataFrame; kwargs...)
    group1keys = [k for (k, v) in pairs(kwargs)]
    df2 = groupby(df, group1keys)[kwargs]
    return df2
end
