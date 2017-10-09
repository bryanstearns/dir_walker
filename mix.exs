defmodule DirWalker.Mixfile do
  use Mix.Project

  @moduledoc """
  DirWalker lazily traverses one or more directory trees, depth first, 
  returning successive file names.

  Initialize the walker using

      {:ok, walker} = DirWalker.start_link(path) # or [path, path...]

  Then return the next `n` path names using

      paths = DirWalker.next(walker <, n \\ 1>)

  Successive calls to `next` will return successive file names, until
  all file names have been returned. 

  These methods have also been wrapped into a Stream resource. 

       paths = DirWalker.stream(path) # or [path,path...]

  """

  def project do
    [
      app:         :dir_walker,
      version:     "0.0.6",
      elixir:      ">= 1.0.0",
      deps:        [],
      description: @moduledoc,
      package:     package()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp package do
    [
      files:        [ "lib", "priv", "mix.exs", "README.md" ],
      contributors: [ "Dave Thomas <dave@pragprog.org>"],
      licenses:     [ "Same as Elixir" ],
      links:        %{
                       "GitHub" => "https://github.com/pragdave/dir_walker",
                    }
    ]
  end
end
