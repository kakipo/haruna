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

    describe "#req_mission_start" do
      context "w/o parameters" do
        it "should raise an error" do
          expect{ @client.req_mission_start }.to raise_error(ArgumentError)
        end
      end
      context "w/ two parameters" do
        subject { @client.req_mission_start(1, 1) }
        its(:body) { should eq "ok" }
      end
    end

    describe "#req_mission_result" do
      context "w/o parameters" do
        it "should raise an error" do
          expect{ @client.req_mission_result }.to raise_error(ArgumentError)
        end
      end
      context "w/ two parameters" do
        subject { @client.req_mission_result(1) }
        its(:body) { should eq "ok" }
      end
    end

    describe "#req_hokyu_charge" do
      context "w/o parameters" do
        it "should raise an error" do
          expect{ @client.req_hokyu_charge }.to raise_error(ArgumentError)
        end
      end
      context "w/ two parameters" do
        subject { @client.req_hokyu_charge(1, [1,2,3]) }
        its(:body) { should eq "ok" }
      end
    end

    describe "#get_member_deck_port" do
      context "w/o parameters" do
        subject { @client.get_member_deck_port }
        its(:body) { should eq "ok" }
      end
      context "w/ a parameter" do
        it "should raise an error" do
          expect{ @client.get_member_deck_port(1) }.to raise_error(ArgumentError)
        end
      end
    end

  end

  describe "validators" do
    before do
      @client = Haruna::Client.new("abcdefg")
    end

    describe "#validate_deck_id" do
      subject{ @client.validate_deck_id(deck_id) }
      context "when deck_id is TOO SMALL" do
        let(:deck_id) { 0 }
        it "should raise error" do
          expect{ subject }.to raise_error(ArgumentError)
        end
      end
      context "when deck_id is MIN" do
        let(:deck_id) { 1 }
        it "should not raise error" do
          expect{ subject }.not_to raise_error
        end
      end
      context "when deck_id is TOO BIG" do
        let(:deck_id) { 5 }
        it "should raise error" do
          expect{ subject }.to raise_error(ArgumentError)
        end
      end
      context "when deck_id is MAX" do
        let(:deck_id) { 4 }
        it "should not raise error" do
          expect{ subject }.not_to raise_error
        end
      end
    end

    describe "#validate_mission_id" do
      subject{ @client.validate_mission_id(mission_id) }
      context "when mission_id is TOO SMALL" do
        let(:mission_id) { 0 }
        it "should raise error" do
          expect{ subject }.to raise_error(ArgumentError)
        end
      end
      context "when mission_id is MIN" do
        let(:mission_id) { 1 }
        it "should not raise error" do
          expect{ subject }.not_to raise_error
        end
      end
    end

    describe "#validate_kind" do
      subject{ @client.validate_supply_kind(kind) }
      context "when kind is TOO SMALL" do
        let(:kind) { 0 }
        it "should raise error" do
          expect{ subject }.to raise_error(ArgumentError)
        end
      end
      context "when kind is MIN" do
        let(:kind) { 1 }
        it "should not raise error" do
          expect{ subject }.not_to raise_error
        end
      end
      context "when kind is TOO BIG" do
        let(:kind) { 4 }
        it "should raise error" do
          expect{ subject }.to raise_error(ArgumentError)
        end
      end
      context "when kind is MAX" do
        let(:kind) { 3 }
        it "should not raise error" do
          expect{ subject }.not_to raise_error
        end
      end
    end

    describe "#validate_ship_ids" do
      subject{ @client.validate_ship_ids(id_arr) }
      context "when id_arr is empty" do
        let(:id_arr) { [] }
        it "should raise error" do
          expect{ subject }.to raise_error(ArgumentError)
        end
      end
      context "when id_arr is VALID" do
        let(:id_arr) { [1, 2, 3] }
        it "should not raise error" do
          expect{ subject }.not_to raise_error
        end
      end
      context "when id_arr contains INVALID id" do
        let(:id_arr) { [1, 2, 0, 3] }
        it "should raise error" do
          expect{ subject }.to raise_error(ArgumentError)
        end
      end
    end

  end



end