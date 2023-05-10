# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

class File
  def self.exists?(file_name)
    exist? file_name
  end
end


require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
