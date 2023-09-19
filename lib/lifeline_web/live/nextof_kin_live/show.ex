defmodule LifelineWeb.NextofKinLive.Show do
  use LifelineWeb, :live_view

  alias Lifeline.NextOfKins

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:nextof_kin, NextOfKins.get_nextof_kin!(id))}
  end

  defp page_title(:show), do: "Show Nextof kin"
  defp page_title(:edit), do: "Edit Nextof kin"
end
