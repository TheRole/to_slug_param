require 'rails-i18n'
require 'stringex_lite'
require 'to_slug_param/string'
require 'to_slug_param/symbol'

module ToSlugParam
  class Engine < Rails::Engine; end

  SPECIAL_SYMBOLS = %[`'"<>[]{}()-+?!/\\.:;$*^~_]

  class << self
    def basic_parameterize(str, sep)
      reg_exp = Regexp.new SPECIAL_SYMBOLS.split('').map { |s| Regexp.escape(s) }.join('|')
      str.gsub(reg_exp, sep)
    end

    def parameterize(str, sep)
      Rails::VERSION::MAJOR > 4          ? \
        str.parameterize(separator: sep) : \
        str.parameterize(sep)
    end
  end
end
