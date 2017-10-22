defmodule FbManager.FFServer do
  @moduledoc """
  Documentation for FbManager.
  """
  use GenServer

  # client 

  def start_link do
    GenServer.start_link __MODULE__, [], name: :ffnerd
  end

  def roster() do
    GenServer.call(:ffnerd, :roster)
  end

  def add(name) do
    GenServer.cast(:ffnerd, {:add, name})
  end 

  # server

  def init(_) do
    {:ok, %{}}
  end

  def handle_call(:roster, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:add, name}, state) do
    client = FFNerd.Client.new("hrqevq4h55mt")
    player = FFNerd.Player.find(name, client)
    new_state = Map.put(state, name, player)
    {:no_reply, new_state}
  end
end

