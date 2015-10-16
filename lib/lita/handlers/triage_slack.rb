require_relative 'triage_channel'

module Lita
  module Handlers
    class TriageSlack < Handler
      config :token #we need a slack API oAuth token of a user, because bots can't create/delete/invite/etc in slack.
      config :users #array of usernames to invite to #triage

      route /\bredalert\s+on\s+(.+)\b/i, :redalert_on, command: true, :help => { "redalert on TOPIC" => "activate the triage channel with TOPIC" }
      def redalert_on(response)
        TriageChannel.new(config.token).activate(response.matches[0][0], config.users)
        response.reply "#triage is now active, all hands to battle stations, standby phasers"
      end

      route /\bredalert\s+off\b/i, :redalert_off, command: true, :help => { "redalert off" => "deactivate the triage channel, stand down red alert" }
      def redalert_off(response)
        TriageChannel.new(config.token).deactivate
        response.reply "#triage is archived, standing down red alert, return to normal duty"
      end
    end

    Lita.register_handler(TriageSlack)
  end
end
