class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.10.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.10.2/difu-0.10.2-aarch64-apple-darwin.tar.gz"
      sha256 "fabfe86be7831feac0004cee5e2db77e675fd190427a995a03076309e5b0a819"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.10.2/difu-0.10.2-x86_64-apple-darwin.tar.gz"
      sha256 "1432eb3b4bac527c0fdca73447ccaf2c74d94ba3ddf5d58de719e70b20eb3db8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.10.2/difu-0.10.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "476f63613158bd5009e40ae8b5ded95a9b02305b3fa23573c6f5243b044c79ec"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.10.2/difu-0.10.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e13a8733da51d2c8d3fadbe32aa199c9ca2955f339ced7b295622474fe01a2fb"
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
