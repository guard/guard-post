# Storefront

> Opinionated Forms, Tables, and Widgets for Rails and Sinatra

## Install

``` bash
gem install storefront
```

## Quick Examples

Below are a few examples of using the view helpers.  Wiki coming soon.  For examples, [see the Haml partials in the specs](https://github.com/viatropos/storefront/tree/master/spec/environment/app/views/partials).

### Forms

``` ruby
= form_for @user do |form|
  = form.fieldset do |fields|
    = fields.field :name
    = fields.field :email
  = form.submit
```

The forms also come with an awesome validation API.  Any model validations will be included in `data-` attributes, such as `<input data-validates-min-message='Your login must be at least 3 characters long.' data-validates-min='3' .../>`.  More documentation on this feature to come.

### Tables

Storefront also builds tables similar to how it builds forms.

``` ruby
= table_for :users do |t|
  = t.head do
    = t.row do
      = t.header "Name"
      = t.header "Email"
      = t.header "Status"
  = t.body do
    - @users.each do |user|
      = t.row do
        = t.cell do
          = link_to user.name, user_path(user)
        = t.cell user.email
        = t.cell user.status.titleize
  = t.foot do
    -# ...
```

### Menus

``` ruby
= widget :menu do
  = nav :home, pages_path(:home)
  = nav :about, pages_path(:about)
```

### Definition Lists

``` ruby
= widget :terms do
  = term :key, "value"
  = term :created_at, time_at(@user.created_at)
```

### Javascript Templates

``` haml
= widget :javascript_template do
  = widget :text, :title => "${title}", :content => "${content}"
```

``` html
<script id='javascript-template' type='text/html'>
  <article class='widget text'>
    <header class='header'>
      <h3 class='title'>${title}</h3>
    </header>
    <p class='content'>${content}</p>
  </article>
</script>
```

### Other Widgets

``` ruby
= widget :text, :title => "Contact Information", :body => "If you have any questions, please feel free to contact us."
```

### Text

``` yaml
en:
  abbreviations:
    CDN: Content Delivery Network
```

``` haml
= keyboard_tag(:command) # <kbd title="command">⌘</kbd>
= keyboard_shortcut_tag(:command, :shift, :s, :shortcut => :save) # <kbd title='save'><kbd title='command'>⌘</kbd><kbd title='shift'> ⇧</kbd><kbd>s</kbd></kbd>
```

## Configure

You can configure pretty much everything, such as what dom structures get auto-generated ids, which ones use aria-roles, default html classes, etc.  Examples soon.

## W3C

- [Promote Web Standards](http://www.w3.org/participate/promote)
- [Join the W3C](http://www.w3.org/Consortium/join.html)
- [W3C Member List](http://www.w3.org/Consortium/Member/List)
- [W3C Membership Fee is $7,900](http://www.w3.org/Consortium/fees)
- [Old W3C Submissions](http://www.w3.org/Submission/)
- [Unicorn (W3C Unified Validator)](http://validator.w3.org/unicorn/)
- [Founder of the W3C](http://en.wikipedia.org/wiki/Tim_Berners-Lee)
- http://xhtml.com/en/future/x-html-5-versus-xhtml-2/

---

<cite>MIT License.  &copy; 2011 <a href="http://lancepollard.com">Lance Pollard</a>.</cite>
