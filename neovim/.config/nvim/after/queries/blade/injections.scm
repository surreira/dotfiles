;; Inject HTML into static text
((text) @injection.content
 (#set! injection.language "html"))

;; Inject PHP into parameters: @if($var)
((parameter) @injection.content
 (#set! injection.language "php"))

;; Inject PHP into {{ $var }}
((inline_php) @injection.content
 (#set! injection.language "php"))
