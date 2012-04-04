require "spec_helper"
require "foreman/engine"
require "foreman/export/inittab"
require "tmpdir"

describe Foreman::Export::Inittab, :fakefs do
  let(:location) { "/tmp/inittab" }
  let(:procfile) { FileUtils.mkdir_p("/tmp/app"); write_procfile("/tmp/app/Procfile") }
  let(:location) { "/tmp/inittab" }
  let(:engine)   { Foreman::Engine.new(procfile) }
  let(:options)  { Hash.new }
  let(:inittab)  { Foreman::Export::Inittab.new(location, engine, options) }

  before(:each) { load_export_templates_into_fakefs("inittab") }
  before(:each) { stub(inittab).say }

  it "exports to the filesystem" do
    inittab.export
    File.read("/tmp/inittab").should == example_export_file("inittab/inittab.default")
  end

  context "to stdout" do
    let(:location) { "-" }

    it "exports to stdout" do
      mock(inittab).puts example_export_file("inittab/inittab.default")
      inittab.export
    end
  end

  context "with concurrency" do
    let(:options) { Hash[:concurrency => "alpha=2"] }

    it "exports to the filesystem with concurrency" do
      inittab.export
      File.read("/tmp/inittab").should == example_export_file("inittab/inittab.concurrency")
    end
  end

end
