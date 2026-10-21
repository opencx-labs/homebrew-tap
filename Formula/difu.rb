class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.24.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.24.1/difu-0.24.1-aarch64-apple-darwin.tar.gz"
      sha256 "f724547056c14d4420b43b761633da8f3c9e6ae2ed48b4483d5d10b04048f606"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.24.1/difu-0.24.1-x86_64-apple-darwin.tar.gz"
      sha256 "ff4ddedc61c4ee2dc2d5c4302eb2a67068acab6a89f73eb67040681fa89c81ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.24.1/difu-0.24.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8cd6dba0b823f2d5ec5ef7f03d0387f7319be3c20d008a13b689ef8afc37950c"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.24.1/difu-0.24.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b687700238c98e2ac3026ddfb4b0d1a5fd1a32445d840ab30380037aed56c931"
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
