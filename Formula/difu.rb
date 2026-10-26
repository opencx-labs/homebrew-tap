class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.27.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.27.2/difu-0.27.2-aarch64-apple-darwin.tar.gz"
      sha256 "721ae84b65acaa588666bf892601fc4b03b57de887124b7c16be4d0b0a96900e"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.27.2/difu-0.27.2-x86_64-apple-darwin.tar.gz"
      sha256 "238115f2233e34e1d362dc45b55116f50499a777035c1e1120297349c49fc41f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.27.2/difu-0.27.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "da64cbec1eea4bae6666e2743909e83f401198872bb612e591427c7a4a972e06"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.27.2/difu-0.27.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "59af13d2ab33f96981bdd386ec37578db275d95151a592ffa03b60c3e842e72b"
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
