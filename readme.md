# Social meta tags

Easily add [Open graph](https://developers.facebook.com/docs/sharing/webmasters#markup) and [Twitter card](https://dev.twitter.com/cards/markup) `<meta>` tags to your Rails 4 application.

## Installation

Add the following to your gemfile and bundle install

```rb
gem 'social_meta_tags'
```

## Configuration

Create `config/initializers/social_meta_tags.rb` and setup your site name

```rb
SocialMetaTags::Options.site_name = "My Site"
```

Add the `<%= social_meta_tags %>` to your `app/views/layouts/application.html.erb`, something like:

```html
<!DOCTYPE html>
<html>
<head>
  <title>My App</title>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
  <%= social_meta_tags %>
</head>
...
```

## Basic Usage

In your view files you will have access to the **social_meta_info** helper

```html
<% social_meta_info(
  title: "This pages title",
  description: "A description of the page"
) %>
```


## Full Usage

In your view files you will have access to the **social_meta_info** helper

```html
<% social_meta_info(
  title: "This pages title",
  description: "A description of the page",
  og: {
    title: "This pages title",
    description: "A description of the page"
  },
  twitter: {
    title: "This pages title",
    description: "A description of the page"
  }
) %>
```
