require 'launchy'
require 'open-uri'
require 'json'

module Gem
  module Web
    class Executor

      def open_page(gem, options)
        if options[:sourcecode]
          find_page(gem, "source_code_uri")
        elsif options[:doc]
          find_page(gem, "documentation_uri")
        elsif options[:webpage]
          find_page(gem, "homepage_uri")
        else
          find_github(gem)
        end
      end

      def find_page(gem, page)
        meta = get_api_metadata(gem)
        launch_browser(gem, meta[page]) unless meta.nil?
      end

      def find_github(gem)
        unless (meta = get_api_metadata(gem)).nil?
          links = [meta["source_code_uri"], meta["documentation_uri"], meta["homepage_uri"]]
          uri = links.find do |link|
            !link.nil? && link.match(/http(s?):\/\/(www\.)?github.com\/.*/i)
          end
          launch_browser(gem, uri)
        end
      end

      def get_api_metadata(gem)
        begin
          JSON.parse(open("https://rubygems.org/api/v1/gems/#{gem}.json").read)
        rescue OpenURI::HTTPError => ex
          puts "Did not find #{gem} on rubygems.org"
          nil
        end
      end

      def launch_browser(gem, uri)
        if uri.nil? || uri.empty?
          puts "Did not find page for #{gem}, opening RubyGems page instead."
          uri = "https://rubygems.org/gems/#{gem}"
        end

        Launchy.open(uri)
      end

    end
  end
end
