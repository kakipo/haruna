# -*- encoding: UTF-8 -*-
require File.expand_path(File.join('./', 'spec_helper'), File.dirname(__FILE__))

describe Haruna do
  describe "#new" do

    context "when token is empty" do
      it "should raise error" do
        expect{ Haruna::Client.new }.to raise_error(ArgumentError)
      end
    end

    context "when token is NOT empty" do
      subject { Haruna::Client.new("abcdefg") }
      it { should be_kind_of Haruna::Client }
    end
  end
end