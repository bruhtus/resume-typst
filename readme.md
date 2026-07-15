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
