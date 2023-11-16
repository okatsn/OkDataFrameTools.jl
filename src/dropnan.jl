"""
`dropnanmissing` replaces `NaN` by `missing`, `dropmissing!` and `disallowmissing`.
"""
function dropnanmissing!(dfcb; kwargs...)
    _preprocess!(dfcb, All())
    dropmissing!(dfcb; kwargs...) # if there is NaN, stacked plot goes wrong
    disallowmissing!(dfcb)
end

"""
"""
function dropnanmissing!(dfcb, cols; kwargs...)
    _preprocess!(dfcb, cols)
    dropmissing!(dfcb, cols; kwargs...) # if there is NaN, stacked plot goes wrong
end

function _preprocess!(dfcb, cols)
    colnames = names(dfcb, cols)
    allowmissing!(dfcb)
    for col in colnames
        replace!(dfcb[!, col], NaN => missing)
    end
end
