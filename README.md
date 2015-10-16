# lita-triage-slack

## Installation

Add lita-triage-slack to your Lita instance's Gemfile:

``` ruby
gem "lita-triage-slack"
```


## Configuration

Generate a slack API oAuth token for a user (since your slack token is for a bot, which can't create/archive/etc channels).
Set the config key for it in your `lita_config.rb`, along with the usernames you'd like to invite to the triage channel when it's created.
``` ruby
config.handlers.triage_slack.token = 'whatever'
config.handlers.triage_slack.users = [ 'Igneous', 'Freud' ]
```

## Usage

```
@bot: redalert on Shit's goin down
bot: #triage is now active, all hands to battle stations, standby phasers
```


```
@bot: redalert off
bot: #triage is archived, standing down red alert, return to normal duty
```

## License

[MIT](http://opensource.org/licenses/MIT)
