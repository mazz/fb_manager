defmodule FbManager.FFServer do
  @moduledoc """
  Documentation for FbManager.
  """
  use GenServer

  def init(_) do
    {:ok, []}
  end

  def start_link(options \\ []) do
    GenServer.start_link __MODULE__, [], options
  end
end
