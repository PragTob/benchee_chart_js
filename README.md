# BencheeChartJS

**Work in progress, not yet published or usable. Let's see if I can make this work :)**

Formatter for [benchee](github.com/PragTob/benchee) to produce some standalone HTML with nice graphs etc. from your benchee benchmarking results :)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `benchee_chart_js` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:benchee_chart_js, "~> 0.1.0"}]
    end
    ```

  2. Ensure `benchee_chart_js` is started before your application:

    ```elixir
    def application do
      [applications: [:benchee_chart_js]]
    end
    ```
