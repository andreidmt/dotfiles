; Keywords
(keyword_def)  @keyword
(keyword_ref)  @keyword
(keyword_enum) @keyword
(indexes)      @keyword
(note_start)   @keyword
(default_start) @keyword
"as"           @keyword

; Table / enum names
(definition (table (identifier) @type))
(enum       (identifier)         @type)

; Schema prefix  schema.TableName
(schema (identifier) @namespace)


; Column: name and type
(item (identifier) @variable)
(item (type)       @type.builtin)

; Enum values
(enum_item (identifier) @string.special)

; Reference columns  users.id > orders.id
(reference (column (identifier) @type (identifier) @variable.member))


; Attribute / setting keywords inside []
(setting_kind) @attribute

; Note string value
(note   (string) @comment.documentation)

; Default value
(default (value (string)     @string))
(default (value (number)     @constant))
(default (value (identifier) @constant))
(default (value (expression) @string.special))

; Standalone values
(string)     @string
(number)     @constant
(expression) @string.special

; Punctuation
["{" "}"]    @punctuation.bracket
["[" "]"]    @punctuation.bracket
["(" ")"]    @punctuation.bracket
["," "."]    @punctuation.delimiter
":"          @punctuation.delimiter

; Comments  // and /* */
(comment) @comment.documentation
