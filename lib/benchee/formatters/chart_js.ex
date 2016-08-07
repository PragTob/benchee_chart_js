defmodule Benchee.Formatters.ChartJS do
  require EEx

  EEx.function_from_file :def, :report,
                         "templates/report.html.eex",
                         [:suite, :suite_json]

  @moduledoc """
  Functionality for converting Benchee benchmarking results to an HTML page
  with chart_js generated graphs and friends.
  """

  @doc """
  Uses `Benchee.Formatters.ChartJS.format/1` to transform the statistics output to
  HTML with JS, but also already writes it to a file defined in the initial
  configuration under `%{chart_js: %{file: "my.csv"}}`
  """
  def output(map)
  def output(suite = %{config: %{chart_js: %{file: file}} }) do
    file = File.open! file, [:write]
    html = suite
           |> format

    IO.write(file, html)
    suite
  end
  def output(_suite) do
    raise "You need to specify a file to write the csv to in the configuration as %{csv: %{file: \"my.csv\"}}"
  end

  @column_descriptors ["Name", "Iterations per Second", "Average",
                       "Standard Deviation",
                       "Standard Deviation Iterations Per Second",
                       "Standard Deviation Ratio", "Median"]

  @doc """
  Transforms the statistical results from benchmarking to html to be written
  somewhere, such as a file through `IO.write/2`.

  """
  def format(suite) do
    suite_json = Benchee.Formatters.JSON.format(suite)
    report(suite, suite_json)
  end
end
