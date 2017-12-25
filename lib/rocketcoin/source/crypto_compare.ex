defmodule Rocketcoin.Source.CryptoCompare do
  @behaviour Rocketcoin.Source

  use HTTPoison.Base

  @base_url "https://min-api.cryptocompare.com"
  @currency_code Application.get_env(:rocketcoin, :currency_code)

  def fetch(from, to) when is_list(from) do
    get!("/data/pricemulti", [], params: %{fsyms: Enum.join(from, ","), tsyms: to}).body
    |> Enum.into(%{}, fn({k, v}) -> {k, round(v[@currency_code] * 100)} end)
  end

  def process_url(url) do
    @base_url <> url
  end

  def process_response_body(body) do
    Poison.decode!(body)
  end
end
