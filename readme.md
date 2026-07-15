# Resume

My personal resume based on [typst's template
imprecv](https://typst.app/universe/package/imprecv/). This resume using
`typst` in the `libs` directory to generate the pdf.

## How to use?

To edit the information, we can edit the file `info.yaml`. To edit the
styling, we can edit the file `template.typ`.

To generate the pdf, we can use [GNU make](https://ftp.gnu.org/gnu/make/) like
this:
```sh
make
```

The default pdf name is `resume.pdf`, and we can change that by providing the
`name` in the `make` command like this:
```sh
make name='your-name-resume'
```

## Commit Subject Style

This project commit subject style based on [conventional
commit](https://www.conventionalcommits.org/en/v1.0.0/) with a few tweaks.
The format is something like this:
```
[optional scope:] <type>: <description>
```

For example:
```sh
libs: chore: add typst version 0.15.0 binary # with the scope
# or
feat: add resume v1.0.0 # without the scope
```

This is so that we can see the changes scope first and then the type. We can
_omit_ the scope if the changes touch multiple scopes. This kind of format
_hopefully_ make things easier to distinguish the commit message that touch
multiple scopes or just one scope.

The ideal scenario would be to only change on specific scope, but sometimes
one thing need another thing in different scope, and writing all of those
scopes in commit subject can be quite lengthy. So just omit those multiple
scopes and be wary of the commit subject without scope.

By default, write every characters in lower case. Only use non-lower case
character when necessary, like spelling out the term or specific function
name. Other than that, use lower case characters. This is so that we can
easily distinguish specific part, like the term or function name.

Not sure if this is the right approach, let's see how it goes.
