defmodule FbManagerTest do
  use ExUnit.Case
  doctest FbManager.FFServer

  test "starts with an empty roster" do
    FbManager.FFServer.start_link 
    
    assert FbManager.FFServer.roster() == %{}
  end

  test "can add a player" do
    FbManager.FFServer.start_link
    # FbManager.FFServer.add("Russell Wilson")
    FbManager.FFServer.add("Russell Wilson")
    
    assert FbManager.FFServer.roster() != %{}
  end

  test "can find a player on the roster" do 
    FbManager.FFServer.start_link
    FbManager.FFServer.add("Russell Wilson")

    assert FbManager.FFServer.find("Russell Wilson") != nil
    
  end

  test "can remove a player on the roster" do
    FbManager.FFServer.start_link
    FbManager.FFServer.add("Russell Wilson")

    FbManager.FFServer.remove("Russell Wilson")

    assert FbManager.FFServer.find("Russell Wilson") == :error
  end

end
