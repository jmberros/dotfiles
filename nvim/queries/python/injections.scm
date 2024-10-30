; ((string_content) @injection.content
;   (#match? injection.content "foobar")
;   (#set! injection.language "sql"))
((string_content) @injection.content
  (#match? @injection.content "^--sql.*")
  (#set! injection.language "sql"))
