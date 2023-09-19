defmodule LifelineWeb.NextofKinLive.Index do
  use LifelineWeb, :live_view

  alias Lifeline.NextOfKins
  alias Lifeline.NextOfKins.NextofKin

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :next_of_kins, list_next_of_kins())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Nextof kin")
    |> assign(:nextof_kin, NextOfKins.get_nextof_kin!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Nextof kin")
    |> assign(:nextof_kin, %NextofKin{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Next of kins")
    |> assign(:nextof_kin, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    nextof_kin = NextOfKins.get_nextof_kin!(id)
    {:ok, _} = NextOfKins.delete_nextof_kin(nextof_kin)

    {:noreply, assign(socket, :next_of_kins, list_next_of_kins())}
  end

  defp list_next_of_kins do
    NextOfKins.list_next_of_kins()
  end
end
