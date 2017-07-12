# Elixzo

Screencapture cli tool for mac os.
After you will capture screen, it will upload image file to your s3 bucket.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixzo` to your list of dependencies in `mix.exs`:

### CLI Application
  1. To install the escript on your mix directory(`/Users/yourusername/.mix/escripts`)

  ```bash
  mix do escript.build, escript.install
  ```

  2. Set your S3 bucket name. write to bashrc if you use bash.

  ```
  export ELIXZO_BUCKET="yours3bucketnamecomeshere"
  ```

## Example

```bash
elixzo
```

If you have executed this command, the url has be copied to the clipboard.


This software is released under the MIT License, see LICENSE.txt.
