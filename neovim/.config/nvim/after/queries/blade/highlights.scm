;; directives like @if, @else
(directive) @function.macro
(directive_start) @function.macro
(directive_end) @function.macro

;; comments {{-- --}}
(comment) @comment

;; keywords inside directives
(keyword) @keyword

;; Parameters inside @directive(...)
((parameter) @variable.parameter)

;; PHP code blocks @php ... @endphp
((php_only) @injection.content
  (#set! injection.language "php"))

;; Brackets
(bracket_start) @punctuation.bracket
(bracket_end) @punctuation.bracket
