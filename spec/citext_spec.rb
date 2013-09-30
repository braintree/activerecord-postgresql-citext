require 'spec_helper'

class Model < ActiveRecord::Base; end

describe "citext" do
  before(:each) do
    ActiveRecord::Schema.define do
      self.verbose = false

      enable_extension("citext")

      create_table :models, :force => true do |t|
        t.citext :name
        t.timestamps
      end
    end
  end

  it "can create citext columns" do
    name_column = Model.columns.detect {|c| c.name == "name"}
    name_column.sql_type.should == "citext"
    name_column.type.should == :citext
  end

  it "save citext contents as a string" do
    Model.create! name: "123"
    Model.first.name.should == "123"
  end
end
