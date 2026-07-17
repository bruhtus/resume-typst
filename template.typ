#let info = yaml("info.yaml")

// Reference:
// https://forum.typst.app/t/how-to-add-page-numbers-only-if-document-length-exceeds-one-page/5323/2
#let paging(page, last) = {
  if last > 1 {
    numbering("1 / 1", page, last)
  }
}

#let config(ctx) = {
  set page(
    paper: "us-letter",
    numbering: paging,
    margin: 1cm,
  )

  set text(
    font: "libertinus serif",
    size: 10pt,
    hyphenate: false,
  )

  set list(
    spacing: 6pt,
  )

  set par(
    leading: 6pt,
    justify: true,
  )

  show link: underline

  show title: content => block(
    width: 100%,
    {
      set text(size: 1.5em, weight: "bold")
      upper(content.body)
      v(-0.2em)
    }
  )

  show heading.where(level: 1): content => block(
    width: 100%,
    {
      set text(size: 1em, weight: "bold")
      upper(content.body)
      v(-0.75em)
      line(length: 100%, stroke: 1pt + black)
    },
  )

  ctx
}

#let parseDate(isoDate) = {
  assert(
    type(isoDate) == str,
    message: "Expected a string value",
  )

  if lower(isoDate) == "present" {
    return "Present"
  }

  assert(
    isoDate.starts-with(
      regex("\\d{4}-\\d{2}")
    ),
    message: "Expected format yyyy-mm",
  )

  let year = int(isoDate.slice(0, 4))
  let month = int(isoDate.slice(5, 7))

  let date = datetime(year: year, month: month, day: 01)
  return date.display("[month repr:short] [year repr:full]")
}

#let general(info) = block(
  width: 100%,
  {
    let generals = ()

    if "email" in info.general and info.general.email != none {
      generals.push(
        box(
          link("mailto:" + info.general.email)
        )
      )
    }

    if "urls" in info.general and info.general.urls != none {
      for url in info.general.urls {
        generals.push(
          box(
            link(url)[#url.split("//").at(1)]
          )
        )
      }
    }

    set text(weight: "medium")

    pad(x: 0em)[
      #generals.join([#sym.space.en #sym.bar.v #sym.space.en])
    ]
  },
)

#let experiences(info) = {
  if "experiences" in info and info.experiences != none {
    block[
      = Experience

      #for exp in info.experiences {
        if ("organization" in exp and exp.organization != none) and ("location" in exp and exp.location != none) {
          block(
            width: 100%,
            breakable: true,
          )[
            *#exp.organization* #h(1fr) *#exp.location*
          ]
        }

        for position in exp.positions {
          block(
            width: 100%,
            breakable: true,
            above: 0.4em,
            below: 1em,
            {
              let startDate = parseDate(position.startDate)
              let endDate = parseDate(position.endDate)

              text(style: "italic")[#position.title]
              h(1fr)

              if startDate == endDate [
                #startDate
              ] else [
                #startDate #sym.dash.en #endDate
              ]

              for hi in position.highlights [
                - #eval(hi, mode: "markup")
              ]
            },
          )
        }
      }
    ]
  }
}

#let educations(info) = {
  if "educations" in info and info.educations != none {
    block[
      = Education

      #for edu in info.educations {
        let startDate = parseDate(edu.startDate)
        let endDate = parseDate(edu.endDate)

        block(
          width: 100%,
          breakable: true,
        )[
          *#edu.institution* #h(1fr) *#edu.location* \
          #text(style: "italic")[#edu.degree]
          #h(1fr)
          #if startDate == endDate [
            #startDate
          ] else [
            #startDate #sym.dash.en #endDate
          ]
        ]

        if "highlights" in edu and edu.highlights != none {
          block(
            width: 100%,
            breakable: true,
            above: 0.4em,
            below: 1em,
            {
              for hi in edu.highlights [
                - #eval(hi, mode: "markup")
              ]
            },
          )
        }
      }
    ]
  }
}

#let activities(info) = {
  if "activities" in info and info.activities != none {
    block[
      = Activities

      #for act in info.activities {
        block(
          width: 100%,
          breakable: true,
        )[
          *#act.name*
        ]

        if "highlights" in act and act.highlights != none {
          block(
            width: 100%,
            breakable: true,
            above: 0.4em,
            below: 1em,
            {
              for hi in act.highlights [
                - #eval(hi, mode: "markup")
              ]
            },
          )
        }
      }
    ]
  }
}

#let projects(info) = {
  if "projects" in info and info.projects != none {
    block[
      = Projects

      #for project in info.projects {
        block(
          width: 100%,
          breakable: true,
        )[
          *#eval(project.name, mode: "markup")*
        ]

        block(
          width: 100%,
          breakable: true,
          above: 0.4em,
          below: 1em,
          {
            for hi in project.highlights [
              - #eval(hi, mode: "markup")
            ]
          },
        )
      }
    ]
  }
}

#let skills(info) = {
  if "skills" in info and info.skills != none {
    block[
      = Skills

      #for skill in info.skills [
        - #eval(skill, mode: "markup")
      ]
    ]
  }
}

#show: config

#align(center + top)[
  #title[#info.general.name]
  #general(info)
]

#experiences(info)
#educations(info)
#activities(info)
#projects(info)
#skills(info)
