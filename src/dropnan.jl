function dropnanmissing!(dfcb)
    allowmissing!(dfcb)
    for col in eachcol(dfcb)
        replace!(col, NaN => missing)
    end
    dropmissing!(dfcb) # if there is NaN, stacked plot goes wrong
    disallowmissing!(dfcb)
end