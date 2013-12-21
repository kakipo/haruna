# -*- encoding: UTF-8 -*-
require File.expand_path(File.join('./', 'spec_helper'), File.dirname(__FILE__))

describe Haruna::API do
  before do
    @token = "abcdefg"
    @end_point = "http://125.6.189.215"
  end

  describe "#new" do
    context "when token & end_point are empty" do
      it "should raise error" do
        expect{ Haruna::API.new }.to raise_error(ArgumentError)
      end
    end

    context "when token & end_point are specified" do
      subject { Haruna::API.new(@token, @end_point) }
      it { should be_an_instance_of Haruna::API }
    end
  end

  describe "#setup_param" do
    subject { Haruna::API.new(@token, @end_point, opts) }
    context "when opt is empty" do
      let(:opts) { nil }
      describe "return value" do
        it { should be_an_instance_of Haruna::API }
      end
      describe "default setting" do
        its(:api_ver) { should eq 1 }
        its(:accept_enc) { should eq "gzip,deflate,sdch" }
        its(:accept_lang) { should eq "ja,en-US;q=0.8,en;q=0.6" }
        its(:content_type) { should eq "application/x-www-form-urlencoded" }
      end
    end
  end

  describe "#setup_param" do
    before do
      @token = @token
      @api = Haruna::API.new(@token, @end_point)
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
      @api = Haruna::API.new(@token, @end_point)
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