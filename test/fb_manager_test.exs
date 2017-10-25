defmodule FbManagerTest do
  use ExUnit.Case
  doctest FbManager.FFServer

  test "starts with an empty roster" do
    {:ok, pid} = FbManager.FFServer.start_link 
    
    assert FbManager.FFServer.roster() == %{}

    FbManager.FFServer.stop(pid)
  end

  test "can add a player" do
    {:ok, pid} = FbManager.FFServer.start_link
    # FbManager.FFServer.add("Russell Wilson")
    FbManager.FFServer.add("Russell Wilson")
    
    assert FbManager.FFServer.roster() != %{}

    FbManager.FFServer.stop(pid)
  end

  test "can find a player on the roster" do 
    {:ok, pid} = FbManager.FFServer.start_link
    FbManager.FFServer.add("Russell Wilson")

    assert FbManager.FFServer.find("Russell Wilson") != nil
    
    FbManager.FFServer.stop(pid)
  end

  test "can remove a player on the roster" do
    {:ok, pid} = FbManager.FFServer.start_link
    FbManager.FFServer.add("Russell Wilson")

    FbManager.FFServer.remove("Russell Wilson")

    assert FbManager.FFServer.find("Russell Wilson") == :error

    FbManager.FFServer.stop(pid)
  end

end
