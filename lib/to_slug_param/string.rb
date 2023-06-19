class String
  def to_slug_param opts = {}
    self.class.to_smart_slug_param(self, opts)
  end

  def to_slug_param_base opts = {}
    self.class.to_slug_param_base(self, opts)
  end

  def slugged_filename opts = {}
    self.class.slugged_filename(self, opts)
  end

  def slugged_filepath opts = {}
    self.class.slugged_filepath(self, opts)
  end

  def to_smart_slug_param opts = {}
    self.class.to_smart_slug_param(self, opts)
  end

  # -----------------------------------
  # Self methods
  # -----------------------------------
  class << self
    def prepare_the_string(str, opts = {})
      opts = opts.symbolize_keys
      sep = opts[:sep] || '-'
      str = str.to_s

      ToSlugParam::parameterize(str, sep)
    end

    def to_slug_param str, opts = {}
      to_smart_slug_param(str, opts)
    end

    def to_slug_param_base str, opts = {}
      opts = opts.symbolize_keys
      sep = opts[:sep] || '-'

      str = prepare_the_string(str, opts).mb_chars

      # TODO: here may be a mistake for different versions of Ruby/Rails
      # I18n::transliterate(str, **opts) || I18n::transliterate(str, opts)

      str = I18n::transliterate(str, **opts)
      str = ToSlugParam::remove_sep_duplications(str, sep)

      ToSlugParam::rails_to_param(str, sep)
    end

    def to_smart_slug_param str, opts = {}
      opts = opts.symbolize_keys
      tolerance = opts[:tolerance] || 75
      str = prepare_the_string(str, opts)

      x = str.to_slug_param_base(opts)
      y = prepare_the_string(str.to_url, opts)

      ratio = (x.size.to_f/y.size.to_f)

      # x=0.0/y=0.0 => NaN
      return '' if ratio.nan?
      # x=1.0/y=0.0 => Infinite
      return x if ratio.infinite?
      # x=0.0/y=1.0 => 0.0
      return y if ratio.zero?
      # ((x=5.0/y=3.0)*100).to_i => 166 => x
      # ((x=3.0/y=5.0)*100).to_i => 60  => y
      (ratio*100).to_i > tolerance ? x : y
    end

    def file_ext file_name, opts = {}
      File.extname(file_name)[1..-1].to_s.to_smart_slug_param opts
    end

    def file_name name, opts = {}
      name = File.basename name
      ext  = File.extname  name
      File.basename(name, ext).to_s.to_smart_slug_param opts
    end

    def slugged_filename name, opts = {}
      name  = File.basename  name
      fname = self.file_name name, opts
      ext   = self.file_ext  name, opts

      return fname if ext.blank?
      [fname, ext].join('.')
    end

    def slugged_filepath file_full_path, opts = {}
      fname = slugged_filename file_full_path, opts
      file_full_path.split('/')[0...-1].push(fname).join '/'
    end
  end
end
