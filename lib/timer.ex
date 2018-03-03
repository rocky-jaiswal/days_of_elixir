defmodule Timer do

  defmacro time_it(name, do: block) do
    quote do
      start_time = Time.utc_now
      result = unquote(block)
      IO.puts "Execution time for #{unquote(name)} is #{Time.diff(Time.utc_now, start_time, :milliseconds)} milliseconds"
      result
    end
  end

end
