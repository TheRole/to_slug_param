### ToSlugParam

Convert strings and symbols to slug param

Transliteration + Parameterization for slugs building

#### Install

```ruby
gem "to_slug_param", "~> 1.2"
```

<a href="http://rubygems.org/gems/to_slug_param">RubyGems/to_slug_param</a>

#### Using

For russian transliteration by default

```ruby
I18n.enforce_available_locales = true

module DummyApp
  class Application < Rails::Application
    config.i18n.default_locale = :ru
  end
end
```

```ruby
"Привет Мир! Hello world!".to_slug_param
# => "privet-mir-hello-world"

String.to_slug_param("Привет Мир! Hello world!")
# => "privet-mir-hello-world"
```

Be carefully with file extension

```ruby
"Документ.doc".to_slug_param
# => "dokument-doc"
```

For filenames:

```ruby
"/доки/dir/тест/документ.doc".slugged_filename         #=> "dokument.doc"
String.slugged_filename("/доки/dir/тест/документ.doc") #=> "dokument.doc"
```

For full file path:

```ruby
"/доки/dir/тест/документ.doc".slugged_filepath         #=> "/доки/dir/тест/dokument.doc"
String.slugged_filepath("/доки/dir/тест/документ.doc") #=> "/доки/dir/тест/dokument.doc"
```

Params

```ruby
"Документ.doc".to_slug_param(locale: :ru) # => "dokument-doc"
"Документ.doc".to_slug_param(locale: :en) # => "doc"
```

```ruby
"Документ.doc".to_slug_param(sep: '_', locale: :ru) # => "dokument_doc"
"Документ.doc".to_slug_param(sep: '_', locale: :en) # => "doc"
```

#### HOW TO TEST

TODO: https://github.com/TheRole/the_role_dev

### MIT-LICENSE

Copyright (c) 2013-2023 [Ilya N.Zykin]

[MIT BASED LICENSE](LICENSE.txt) 
