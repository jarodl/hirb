require 'json'

$binding ||= binding

class Hirb::Eval
  class << self
    def eval(cmd)
      JSON.generate(
        steal_output { Kernel.eval("_ = #{cmd}", $binding) }
      )
    end
  
    def steal_output(&b)
      # Hold on to stdout and stderr
      stdout, stderr = $stdout, $stderr
  
      # Redirect stdout and stderr
      $stdout, $stderr = StringIO.new, StringIO.new

      result = nil
      begin
        result = b.call.inspect
      rescue
        $stderr.puts $!
        $stderr.puts $!.backtrace

        stderr.puts $!
        stderr.puts $!.backtrace
      end
  
      r = {
        :result => result,
        :out    => $stdout.string.split("\n"),
        :err    => $stderr.string.split("\n")
      }
  
      # Set stdout and stderr back
      $stdout, $stderr = stdout, stderr
  
      r
    end
  end
end

