# -*- encoding: UTF-8 -*-
require File.expand_path(File.join('./', 'spec_helper'), File.dirname(__FILE__))

describe Haruna::Client do

  describe "#new" do
    context "when token is empty" do
      it "should raise error" do
        expect{ Haruna::Client.new }.to raise_error(ArgumentError)
      end
    end

    context "when token is NOT empty" do
      subject { Haruna::Client.new("abcdefg") }
      it { should be_an_instance_of Haruna::Client }
    end
  end

  describe "client commands" do
    before do
      @client = Haruna::Client.new("abcdefg")
      @client.conn = create_stub_connection # overwrite faraday adapter
    end

    describe "#go_mission" do
      context "w/o parameters" do
        it "should raise an error" do
          expect{ @client.go_mission }.to raise_error(ArgumentError)
        end
      end
      context "w/ two parameters" do
        subject { @client.go_mission(1, 1) }
        its(:body) { should eq "ok" }
      end
    end

    describe "#get_mission_result" do
      context "w/o parameters" do
        it "should raise an error" do
          expect{ @client.get_mission_result }.to raise_error(ArgumentError)
        end
      end
      context "w/ two parameters" do
        subject { @client.get_mission_result(1) }
        its(:body) { should eq "ok" }
      end
    end

    describe "#supply_material" do
      context "w/o parameters" do
        it "should raise an error" do
          expect{ @client.supply_material }.to raise_error(ArgumentError)
        end
      end
      context "w/ two parameters" do
        subject { @client.supply_material(1, [1,2,3]) }
        its(:body) { should eq "ok" }
      end
    end



  end



end