defmodule FbManager.FFServer do
  @moduledoc """
  Documentation for FbManager.
  """
  use GenServer

  # client 

  def start_link do
    GenServer.start_link __MODULE__, [], name: :ffnerd ## returns {:ok, pid}
  end

  def stop(pid) do
    GenServer.stop(pid)
  end

  def roster() do
    GenServer.call(:ffnerd, :roster)
  end

  def add(name) do
    GenServer.cast(:ffnerd, {:add, name})
  end 

  def find(name) do
    # IO.puts(name)
    GenServer.call(:ffnerd, {:find, name})
  end

  def remove(name) do
    GenServer.cast(:ffnerd, {:remove, name})
  end

  # server

  def init(_) do
    {:ok, %{}}
  end

  def handle_call(:roster, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:find, name}, _from, state) do
    found = Map.fetch(state, name)
    {:reply, found, state}
  end

  def handle_cast({:add, name}, state) do
    client = FFNerd.Client.new("hrqevq4h55mt")
    player = FFNerd.Player.find(name, client)
    new_state = Map.put(state, name, player)
    {:noreply, new_state}
  end
  
  def handle_cast({:remove, name}, state) do
    new_state = Map.delete(state, name)
    {:noreply, new_state}
  end
end

