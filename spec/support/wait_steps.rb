require "timeout"

RSpec::Matchers.define :become_true do
  match do |block|
    begin
      Timeout.timeout(Capybara.default_wait_time) do
        until value = block.call
          sleep 0.1
        end
        value
      end
    rescue TimeoutError
      false
    end
  end

  def supports_block_expectations?
    true
  end
end
