require 'rails-i18n'
require 'stringex_lite'
require 'to_slug_param/string'
require 'to_slug_param/symbol'

module ToSlugParam
  class Engine < Rails::Engine; end

  SPECIAL_SYMBOLS = %[`'"<>[]{}()-+?!/\\.:;|#\$@&*^%=~_]

  REPLACE_SPEC_SYMB_REGEXP = Regexp.new(
    SPECIAL_SYMBOLS.split('').map do |s|
      Regexp.escape(s)
    end.join('|')
  )

  class << self
    def parameterize(str, sep)
      str = str.to_s.strip.gsub(/[[:space:]]/, sep)
      str = str.gsub(REPLACE_SPEC_SYMB_REGEXP, sep)
      remove_sep_duplications(str, sep)
    end

    def remove_sep_duplications str, sep
      escaped_sep = Regexp.escape sep

      str.gsub(/\A#{escaped_sep}{1,}/, '')
         .gsub(/#{escaped_sep}{2,}/, sep)
         .gsub(/#{escaped_sep}{1,}\z/, '').to_s
    end

    def rails_to_param(str, sep)
      Rails::VERSION::MAJOR > 4          ? \
        ActiveSupport::Inflector.parameterize(str, separator: sep) : \
        ActiveSupport::Inflector.parameterize(str, sep)
    end
  end
end
