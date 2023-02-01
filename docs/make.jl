using OkDataFrameTools
using Documenter

DocMeta.setdocmeta!(OkDataFrameTools, :DocTestSetup, :(using OkDataFrameTools); recursive=true)

makedocs(;
    modules=[OkDataFrameTools],
    authors="okatsn <okatsn@gmail.com> and contributors",
    repo="https://github.com/okatsn/OkDataFrameTools.jl/blob/{commit}{path}#{line}",
    sitename="OkDataFrameTools.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://okatsn.github.io/OkDataFrameTools.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/okatsn/OkDataFrameTools.jl",
    devbranch="main",
)
