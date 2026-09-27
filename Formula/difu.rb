class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.15.0/difu-0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "88b90afd5d98a7bdb049dc870e8d9a555a7f2f24bf9f9762381ab0ee222e5426"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.15.0/difu-0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "1343afd500db2d73fc89b92be554fffc41eb3d4e728f156c3013b5793111f6b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.15.0/difu-0.15.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "28d4e2f5fa8298afe1847f102aa7ec1504be533d4c957a36e18ebc7d04461c54"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.15.0/difu-0.15.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5011d3a34b9c6728476114ed746ec1b686f925ea282504e8361f6240e5c79d98"
    end
  end

  def install
    bin.install "difu"
  end

  def caveats
    <<~EOS
      Git, GitHub CLI (gh), and Codex CLI must already be on your PATH.
      Authenticate if needed with `gh auth login` and `codex login`.
      Run `difu` to open Agents; switch to Reviews for pull requests.
    EOS
  end

  test do
    assert_match "difu #{version}", shell_output("#{bin}/difu --version")
    assert_match "difu needs an interactive terminal", shell_output("#{bin}/difu 2>&1", 1)
  end
end
