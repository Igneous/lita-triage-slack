require 'slack'

class TriageChannel
  def initialize(token)
    @client = Slack::RPC::Client.new(token)
  end

  def find_user_id(user_name)
    @client.users.list.body['members'].find do |user| 
      user['name'] == user_name
    end.fetch('id')
  end

  def find_channel_id(chan_name)
    @client.channels.list.body['channels'].find do |chan|
      chan['name'] == chan_name
    end.fetch('id')
  end

  def find_users_in_channel(chan_name)
    chan_id = find_channel_id(chan_name)
    @client.channels.info(channel: chan_id).body['channel']['members']
  end

  def gimmie_chan(chan_name)
    @client.channels.create(name: chan_name)
    @client.channels.unarchive(channel: find_channel_id(chan_name))
    find_channel_id(chan_name)
  end

  def activate(msg, users)
    chan_id = gimmie_chan('triage')

    @client.channels.setPurpose(channel: chan_id, purpose: "The situation room.")
    @client.channels.setTopic(channel: chan_id, topic: ":redalert: #{msg} :redalert:")

    users.each do |user|
      @client.channels.invite(channel: chan_id, user: find_user_id(user))
    end
  end

  def deactivate
    chan_id = gimmie_chan('triage')

    find_users_in_channel('triage').each do |user|
      @client.channels.kick(channel: chan_id, user: user)
    end

    @client.channels.archive(channel: chan_id)
  end
end
