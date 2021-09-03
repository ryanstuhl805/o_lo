require 'spec_helper'

describe ::Olo do
  subject { Olo.log(thing, decorator, decorator_length) }

  describe "#log" do
    context "happy path" do
      context "thing is a string" do
        let(:thing)               { "Testing the output of a string in o_lo." }
        let(:decorator)           { "#" }
        let(:decorator_length)    { 99 }

        it "calls log and outputs a string including the decorator" do
          expect{subject}.to output(a_string_including(decorator * decorator_length)).to_stdout
        end

        it "calls log and outputs a string including the thing" do
          expect{subject}.to output(a_string_including(thing)).to_stdout
        end
      end

      context "thing is an object" do
        let(:thing)               { Object.new }
        let(:decorator)           { "^" }
        let(:decorator_length)    { 42 }

        it "calls log and outputs a string including the decorator" do
          expect{subject}.to output(a_string_including(decorator * decorator_length)).to_stdout
        end

        it "calls log and outputs an object" do
          expect{subject}.to output(a_string_including(thing.inspect)).to_stdout
        end
      end

      context "thing is defined but decorator and decorator_length are not" do
        let(:thing)               { "Thanks for all the fish!" }
        let(:decorator)           { nil }
        let(:decorator_length)    { nil}
      end 
    end

    context "sad path" do
      context "thing is blank" do
        let(:thing)               { nil }
        let(:decorator)           { nil }
        let(:decorator_length)    { nil }

        it "does not output anything" do
          expect{subject}.not_to output(a_string_including("*" * 100)).to_stdout
        end
      end

      context "decorator is an object" do
        let(:thing) { "Some people like to watch the world burn" }
        let(:decorator) { Object.new }
        let(:decorator_length) { 42 }

        it "omits the decorator if it is an object" do
          expect{subject}.to output(a_string_including("*" * decorator_length)).to_stdout
        end
      end

      context "decorator is an integer" do
        let(:thing) { Object.new }
        let(:decorator) { 7 }
        let(:decorator_length) { nil }

        it "sets the decorator to a stringified version of itself" do
          expect{subject}.to output(a_string_including("7" * 100)).to_stdout
        end
      end

      context "decorator_length is greater than 200" do
        let(:thing) { Object.new }
        let(:decorator) { "!" }
        let(:decorator_length) { 1000 }

        it "truncates the decorator length if it is over 200" do
          expect{subject}.not_to output(a_string_including(decorator * decorator_length)).to_stdout
        end
      end
    end
  end
end
