defmodule Enqueuer do
  use GenServer

  def start_link(initial_state \\ []) do
    GenServer.start_link(__MODULE__, initial_state, name: __MODULE__)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @spec enqueue(Integer.t()) :: :ok | :error
  def enqueue(element) when is_integer(element) do
    GenServer.cast(__MODULE__, {:enqueue, element})
  end

  def enqueue(_), do: :error

  @spec dequeue :: Integer.t()
  def dequeue() do
    GenServer.call(__MODULE__, :dequeue)
  end

  @impl true
  def handle_call(:dequeue, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_call(:dequeue, _from, []) do
    {:reply, nil, []}
  end

  @impl true
  def handle_cast({:enqueue, element}, state) do
    {:noreply, [element | state]}
  end
end
