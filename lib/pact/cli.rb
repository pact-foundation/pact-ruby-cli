require "pact/cli/version"
require 'pact_broker/client/cli/broker'
require 'pactflow/client/cli/pactflow'
require 'pact/provider_verifier/cli/verify'
require 'pact/mock_service/cli'

class Thor
  module Base
    module ClassMethods
      def basename
        argv = ARGV.dup
        argv.delete("help")
        if ENV['DOCKER']
          argv.unshift # remove "pact"
          argv.first || ""
        else
          argv.first || "pact"
        end
      end
    end
  end
end

module Pact
  class AggregatedCLI < Thor
    HELP = ["help", "--help", "-h"]

    desc 'mock-service', 'Run a Pact mock service'
    def mock_service
      ::Pact::MockService::CLI.start(process_argv("mock-service"))
    end

    desc 'stub-service', 'Run a Pact stub service'
    def stub_service
      require 'pact/stub_service/cli'
      Pact::StubService::CLI.start(process_argv("stub-service"))
    end

    desc 'broker', 'Interact with a Pact Broker'
    def broker
      ::PactBroker::Client::CLI::Broker.start(process_argv("broker"))
    end

    if ENV["PACTFLOW_FEATURES"]
      desc 'pactflow', 'Interact with Pactflow - beta release'
      def pactflow
        ::Pactflow::Client::CLI::Pactflow.start(process_argv("pactflow"))
      end
    end

    desc 'verify PACT_URL ...', Pact::ProviderVerifier::CLI::Verify.commands["verify"].description
    long_desc Pact::ProviderVerifier::CLI::Verify.commands["verify"].long_description

    def verify
      argv = ARGV.dup
      while argv.any? && !argv.first.start_with?("-")
        argv.shift
      end
      ENV["PACT_INTERACTION_RERUN_COMMAND"] ||= "PACT_DESCRIPTION=\"<PACT_DESCRIPTION>\" PACT_PROVIDER_STATE=\"<PACT_PROVIDER_STATE>\" #{$PROGRAM_NAME} verify <PACT_URI> #{argv.join(" ")}"

      Pact::ProviderVerifier::CLI::Verify.start(process_argv(""))
    end

    desc ::PactBroker::Client::CLI::Broker.commands["publish"].usage, ::PactBroker::Client::CLI::Broker.commands["publish"].description
    long_desc ::PactBroker::Client::CLI::Broker.commands["publish"].long_description

    def publish
      ::PactBroker::Client::CLI::Broker.start(process_argv(""))
    end

    desc "version", "Print the version"
    def version
      require 'pact/cli/version'
      puts Pact::Cli::VERSION
    end

    no_commands do
      def self.exit_on_failure?
        true
      end

      def process_argv(subcommand)
        is_help = (ARGV & HELP).any?
        argv = ARGV - [subcommand] - HELP
        argv.unshift("help") if is_help
        argv
      end
    end
  end
end
