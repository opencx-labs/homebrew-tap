class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.18.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.1/difu-0.18.1-aarch64-apple-darwin.tar.gz"
      sha256 "0b22d1f93a0f96b974e7178045752ff65c35d2ee7e4820fd3d32b0a599318def"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.1/difu-0.18.1-x86_64-apple-darwin.tar.gz"
      sha256 "d4304057a98dc9c21aadd06be5d23659018893a3403cf032633b98d61fa8e045"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.1/difu-0.18.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "306daf1a18f832c14da95c7c38fe8fdee2e485eb79d52b4ef3305a45471b81e0"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.1/difu-0.18.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ca255907ace36f4c59ece0bcb06727e14d6f2a5670a683f719a647766fb630e4"
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
