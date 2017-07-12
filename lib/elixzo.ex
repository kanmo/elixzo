defmodule Elixzo do
  @moduledoc """
  Screencapture Command Tool for Mac OS
  """

  @doc """
  Capture screen interactively.
  And save file local tmp directory and upload image S3 Bucket.

  ## Examples

      iex> Elixzo.capture
      "https://s3-ap-northeast-1.amazonaws.com/bucket-name/file-name"

  """
  def capture do
    {:ok, now} = Timex.format(Timex.now, "%Y%m%d-%H%M%S", :strftime)
    fname = "#{now}.png"
    bucket = Application.get_env(:elixzo, :bucket)
    region = Application.get_env(:ex_aws, :region)

    System.cmd("screencapture", ["-i", "/tmp/#{fname}"])

    ExAws.S3.put_object(bucket, fname, File.read!("/tmp/#{fname}"))
    |> ExAws.request!

    :os.cmd('echo "https://s3-#{region}.amazonaws.com/#{bucket}/#{fname}" | pbcopy')

    IO.puts "https://s3-#{region}.amazonaws.com/#{bucket}/#{fname}"
  end

end
