require 'spec_helper'

describe Gem::Web::Executor do

  it "should open the documentation" do
    VCR.use_cassette('documentation') do
      expect(Launchy).to receive(:open).with("http://api.rubyonrails.org")
      Gem::Web::Executor.new.open_page("rails", {doc: true})
    end
  end

  it "should open the homepage" do
    VCR.use_cassette('homepage') do
      expect(Launchy).to receive(:open).with("http://www.rubyonrails.org")
      Gem::Web::Executor.new.open_page("rails", {webpage: true})
    end
  end

  it "should open the source code" do
    VCR.use_cassette('sourecode') do
      expect(Launchy).to receive(:open).with("http://github.com/rails/rails")
      Gem::Web::Executor.new.open_page("rails", {sourcecode: true})
    end
  end

  it "should open github" do
    VCR.use_cassette('github') do
      expect(Launchy).to receive(:open).with("http://github.com/rails/rails")
      Gem::Web::Executor.new.open_page("rails", {sourcecode: true})
    end
  end

end
