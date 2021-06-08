defmodule EnqueuerTest do
  use ExUnit.Case

  setup_all do
    {:ok, _pid} = Enqueuer.start_link()
    :ok
  end

  describe "enqueue/1" do
    test "can enqueue a number successfully" do
      assert Enqueuer.enqueue(1) == :ok
    end

    test "when given an invalid value, returns an error" do
      assert Enqueuer.enqueue("a") == :error
    end
  end

  describe "dequeue/0" do
    setup :add_number_to_queue

    test "can remove a number from queue" do
      assert Enqueuer.dequeue() == 1
    end

    defp add_number_to_queue(_) do
      Enqueuer.enqueue(1)
    end
  end
end
