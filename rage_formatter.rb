require 'rspec/core/formatters/progress_formatter'

class RageFormatter < RSpec::Core::Formatters::ProgressFormatter
  
  def initialize(output)
    @@fails = []
    super
  end

  def example_failed(example)
    @@fails << 'U'
    super
  end

  def example_pending(example)
    rage
    super
  end

  def example_passed(example)
    rage
    super
  end

  def stop()
    rage
  end

  private

  def rage
    print @@fails.join ''
    @@fails = []
  end
end
