defmodule Example.BitcoinPriceUpdater do
  use Task

  def start_link(_arg) do
    Task.start_link(&poll/0)
  end

  def poll() do
    receive do
    after
      1000 ->
        get_price()
        poll()
    end
  end

  defp get_price() do
    # Call API & Persist
    # info = Node.Pisystem.Logics.PisystemLogic.get_system_info()
    # info |> IO.inspect()
  end
end
