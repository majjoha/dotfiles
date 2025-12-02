;; extends
(call
  method: (identifier) @rspec.describe
  (#match? @rspec.describe "^(describe|context|x?it)$")) @block

((call
  method: (identifier) @accessor
    (#match? @accessor "^(attr_reader|attr_writer|attr_accessor)")))

((comment) @comment
  (#match? @comment "frozen_string_literal")) @comment.frozen

(nil) @constant.builtin.nil

((identifier) @id
  (#match? @id "^(private)")) @keyword.modifier.private

(string_content) @string_content
