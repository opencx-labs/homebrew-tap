class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.46.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.46.0/difu-0.46.0-aarch64-apple-darwin.tar.gz"
      sha256 "8fc3d473a393cb37554d31bf3455a268201e10063cdfaba79df647f34641f9c5"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.46.0/difu-0.46.0-x86_64-apple-darwin.tar.gz"
      sha256 "e675e843d225c1df77c8ddff1be66c8e030f6895731a4f52b1a6a2972acedb23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.46.0/difu-0.46.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5f1146f20ce62e8cc5c85b553fb31462ec5f6ba45150d7db295cbdf263e4728d"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.46.0/difu-0.46.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9fd5a28ec4f19c210ffb2daa86bd126126b62740314bc971f6f1bebca71d8673"
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
