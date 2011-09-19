# GuardPost

> Watch Static Files, Convert them to Database Records (Mongoid, ActiveRecord, etc.).

## Install

``` bash
gem install guard-post
guard init post
```

## Usage

This just tells you when a file has changed.  You can use this for blogging with [post-modern](https://github.com/viatropos/post-modern), which just reads a Markdown file with a YAML header (like in Jekyll), and syntax highlights the content (and executes inline Haml so you can use Haml in markdown for things like tables).  Here's an example:

### Guardfile

``` ruby
# :update => callback, :rails => true|false (loads current development rails env if so)
guard "post", :update => lambda { |file| Post.save_from_file!(file) } do
  watch(%r{^app/documents/(.+\.md)})
end
```

### Example Model

``` ruby
# app/models/post.rb
class Post
  include Mongoid::Document
  
  field :title
  field :tags, :type => Array
  field :content
  
  def save_from_file!(path)
    attributes  = PostModern.read(path)
    post        = Post.where(:file => attributes[:file]).first
    
    if post.present?
      post.update_attributes(attributes)
    else
      post = Post.create(attributes)
    end

    post
  end
end
```

This way, whenever you save a markdown file, you can render the content and save it to some database, making static files dynamic.

---

<cite>MIT License.  &copy; 2011 <a href="http://lancepollard.com">Lance Pollard</a>. Free to use for whatever.</cite>