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

## Using github release

To put the resume file on github release, we need to create new tag like
this:
```sh
git tag -a v1.0.0
```
and then put the some info in the tag message body.

For example, if the tag name is `v1.0.0`, we can put the tag
message body like this:
```
v1.0.0

- First release.
```

After we create the tag in our local machine, we can push the tag like this:
```sh
git push origin v1.0.0
```

To delete the tag in remote repository, we can do it like this:
```sh
git push origin --delete v1.0.0
```

We can also delete the tag in our local repository like this:
```sh
git tag -d v1.0.0
```

To delete all the tags in remote repository, we can use this command:
```sh
git tag | xargs -L 1 | xargs git push origin --delete
```

And to delete all the tags in local repository, we can use this command:
```sh
git tag | xargs -L 1 | xargs git tag -d
```

Reference for delete multiple git tags:<br>
https://stackoverflow.com/a/34395864

### Guideline for release

To make the release version easier to understand, we can use this guide:
- The major release is for adding new section, such as add new section
certifications. Every time we add new section, we can bump the major release
number. The major release number is the first number after `v` character.
Like in release `v1.0.0`, the major release number is `1`.

- The minor release is for adding, removing, or replacing item, such as add
new experience or replacing item in projects section. We can bump the minor
release every time we done that. The minor release number is the second
number after the `v` character. Like in release `v1.2.0`, the minor release
number is `2`.

- The patch release is for changing the item content, such as changing
experience highlights. We can bump the patch release number every time we done
that. The patch release number is the third number after the `v` character.
Like in release `v1.2.3`, the patch release number is `3`.
