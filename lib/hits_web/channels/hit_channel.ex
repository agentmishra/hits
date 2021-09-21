defmodule HitsWeb.HitChannel do
  use HitsWeb, :channel

  def join("hit:lobby", _payload, socket) do
    # if authorized?(payload) do
    {:ok, socket}
    # else
    #   {:error, %{reason: "unauthorized"}}
    # end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (hit:lobby).
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

  # Commenting out this function as "true" is meaningless!
  # Add authorization logic here as required.
  # defp authorized?(_payload) do
  #   true
  # end
end
