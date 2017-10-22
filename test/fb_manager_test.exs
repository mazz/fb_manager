defmodule FbManagerTest do
  use ExUnit.Case
  doctest FbManager.FFServer

  test "starts with an empty roster" do
    { :ok, ffnerd } = FbManager.FFServer.start_link 
    assert FbManager.FFServer.roster() == []
  end
end
