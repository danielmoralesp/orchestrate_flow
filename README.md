# OrchestrateFlow

## Why a New Orchestration Gem?
Most existing Ruby gems, like AASM or workflow, are simple state machines and don’t address complex orchestration. Here’s what `OrchestrateFlow` gem could uniquely offer for you or your team:

- **Native Orchestration in Ruby**: We specifically focused on complex workflows and orchestration, and we don't rely on external bridges or workarounds.
- **Advanced Workflow Capabilities**: We include features like parallel task execution, retries, timeouts, and long-running workflows which is quite different from simple state machines and give you orchestration power.
- **Persistence for Long-Running Tasks**: With a persistence layer (using ActiveRecord), we support long-running processes that can survive server restarts.
- **Ease of Use for Rails Developers**: We offer seamless integration with ActiveRecord, and ActiveJob (for background jobs), and other Rails tools, so you won't need bridge service models anymore, so we make workflow orchestration feel “native” to Rails
- **Lower Operational Overhead**: We provide enough orchestration power without any heavy setup (avoiding deploying and maintining additional servers), making it more accessible to smaller teams.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'orchestrate_flow'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install orchestrate_flow

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/orchestrate_flow. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/orchestrate_flow/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OrchestrateFlow project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/orchestrate_flow/blob/master/CODE_OF_CONDUCT.md).


## Special thanks

This gem has being build with the support of the amazing team at Compensix.com. Many thanks for allowing this to happen!
