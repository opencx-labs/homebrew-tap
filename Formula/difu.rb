class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.44.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.44.0/difu-0.44.0-aarch64-apple-darwin.tar.gz"
      sha256 "249724e4356f55da82a931d9ba35c3114aa1692c0dab4b1e3c6c7b0d2a1553b9"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.44.0/difu-0.44.0-x86_64-apple-darwin.tar.gz"
      sha256 "d2d03d4fa28675e9e0cfec1cb6e396e1d048d4681c6126857b98fdd0216eddca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.44.0/difu-0.44.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b4a3711eda876608b32848eb78078405ac9509f426e25449c1feea3a49c81087"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.44.0/difu-0.44.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1ed4140ee4ca8e2bfe3adfbddcb17e2f3d3043906b53e788d7b633bcf6bbbaa2"
    end
  end

  def install
    bin.install "difu"
    libexec.install "DifuNotifications.app" if OS.mac?
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
