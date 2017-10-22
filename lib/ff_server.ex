defmodule FbManager.FFServer do
  @moduledoc """
  Documentation for FbManager.
  """
  use GenServer

  # client 

  def init(_) do
    {:ok, []}
  end

  def start_link do
    GenServer.start_link __MODULE__, [], name: :ffnerd
  end

  def roster() do
    GenServer.call(:ffnerd, :roster)
  end

  # server

  def handle_call(:roster, _from, state) do
    {:reply, state, state}
  end

end