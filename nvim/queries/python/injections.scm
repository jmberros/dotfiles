((string_content) @injection.content
  (#lua-match? injection.content "^--sql")
  (#set! injection.language "sql"))
