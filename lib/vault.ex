defmodule Vault do
  @moduledoc """
  Documentation for `Vault`.
  """
  @version Mix.Project.config[:version]

  def main(args) do
    switches = [version: :boolean, create: :boolean]
    aliases = [v: :version, c: :create]

    {opts, _args, _errors} =
      OptionParser.parse(args, switches: switches, aliases: aliases)

    cond do
      opts[:version] -> version()
      opts[:create] -> create_vault()
      true -> help(switches, aliases)
    end
  end

  def version do
    IO.puts("Vault @ Build #{@version}")
  end

  def create_vault do
    IO.puts("Creating vault...")
  end

  def help(switches, aliases) do
    help_message =
      switches
      |> OptionParser.to_argv()
      |> Enum.map_join("\n", fn arg -> "  #{arg}#" end)

    IO.puts """
    Usage: vault [OPTIONS]

    Options:
    #{help_message}
    """
  end
end
