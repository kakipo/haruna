# coding: utf-8
require File.expand_path(File.join('./', 'spec_helper'), File.dirname(__FILE__))

describe Haruna::CachedClient do

  before do
    @token = "abcdefg"
    @end_point = "http://125.6.189.215"
  end

  describe "#new" do
    context "when token & end_point are empty" do
      it "should raise error" do
        expect{ Haruna::CachedClient.new }.to raise_error(ArgumentError)
      end
    end

    context "when token & end_point are NOT empty" do
      subject { Haruna::CachedClient.new(@token, @end_point) }
      it { should be_an_instance_of Haruna::CachedClient }
    end
  end

end