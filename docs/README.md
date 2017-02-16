The Documenter autodeploy reason is not working for some reason.

To update the documentation manually:
- checkout master
- cd docs/
- julia make.jl
- mkdocs build
- checkout gh-pages
