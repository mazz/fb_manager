defmodule FbManagerTest do
  use ExUnit.Case
  doctest FbManager

  test "greets the world" do
    assert FbManager.hello() == :world
  end
end
