# -*- encoding: UTF-8 -*-
require File.expand_path(File.join('./', 'spec_helper'), File.dirname(__FILE__))

describe Haruna::API do
  describe "#new" do

    context "when token is empty" do
      it "should raise error" do
        expect{ Haruna::API.new }.to raise_error(ArgumentError)
      end
    end

    context "when token is NOT empty" do
      subject { Haruna::API.new("abcdefg") }
      it { should be_an_instance_of Haruna::API }
    end
  end

  describe "#setup_param" do
    before do
      @token = "abcdefg"
      @api = Haruna::API.new(@token)
    end

    subject { @api.setup_param(param) }

    context "when passed param has NO elements" do
      let(:param) { {} }
      its(:size) { should eq 2 }
      its([:api_verno]) { should eq 1 }
      its([:api_token]) { should eq @token }
    end

    context "when passed param has AN element" do
      let(:param) { {hoge: :foo} }
      its(:size) { should eq 3 }
      its([:hoge]) { should eq :foo }
      its([:api_verno]) { should eq 1 }
      its([:api_token]) { should eq @token }
    end
  end

  describe "#call" do
    before do
      @api = Haruna::API.new("abcdefg")
      @api.conn = create_stub_connection # overwrite faraday adapter
    end

    subject { @api.call("get_seafood", target, {}) }

    context "when target is tamago" do
      let(:target) { "tamago" }
      its(:body) { should eq 'egg' }
    end

    context "when target is ebi" do
      let(:target) { "ebi" }
      its(:body) { should eq 'shrimp' }
    end

    context "when target is uni" do
      let(:target) { "uni" }
      its(:body) { should eq 'urchin' }
    end
  end

end