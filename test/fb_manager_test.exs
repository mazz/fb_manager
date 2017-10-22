defmodule FbManagerTest do
  use ExUnit.Case
  doctest FbManager.FFServer

  test "starts with an empty roster" do
    FbManager.FFServer.start_link 
    # IO.inspect(FbManager.FFServer.roster())
    
    ## fails with: mix test
    assert FbManager.FFServer.roster() == %{}


  end

  test "can add a player" do
    FbManager.FFServer.start_link
    FbManager.FFServer.add("Russell Wilson")
    # IO.inspect(FbManager.FFServer.roster())
    
    ## fails with: mix test --no-start
    assert FbManager.FFServer.roster() != %{}
  end    
end
