# Copyright 2026 SECO Mind Srl
# SPDX-License-Identifier: Apache-2.0

defmodule Mix.Tasks.Token do
  use Mix.Task

  @shortdoc "Generates a token for the forwarder"

  @requirements ["app.start"]

  @impl Mix.Task
  def run([session, protocol, port]) do
    {:ok, jwt, _claims} =
      EdgehogDeviceForwarderWeb.Guardian.encode_and_sign(:forwarder_session, %{
        session: session,
        protocol: protocol,
        port: port
      })

    Mix.shell().info(jwt)
  end
end
