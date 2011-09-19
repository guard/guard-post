# Haml in Markdown!

> Write HAML write in the middle of your markdown, and it'll be converted into HTML.

And it will inherit the view context if it's in Rails.

## Example

@@@ haml
%dl
  %dt Haml
  %dd
    %ul
      %li Makes it easy to do semantic markup
      %li Makes it so your markdown can have real layout code in it
      %li Is clean
@@@
