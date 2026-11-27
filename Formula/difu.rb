class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.52.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.52.0/difu-0.52.0-aarch64-apple-darwin.tar.gz"
      sha256 "d9ba8f4943639dd3f379079a1b0cd445f9198fc35795e509e142d3afa24da9c3"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.52.0/difu-0.52.0-x86_64-apple-darwin.tar.gz"
      sha256 "569649487cb1241c17eb651d06372ee2b7d3917fd191956a386cbe0aca7a60ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.52.0/difu-0.52.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f900cb1ea65257d79bdb2f3e383dc832843b73ae3b3477d62afadcddd6189b93"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.52.0/difu-0.52.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "af1ecaf4721b44eacc8561c50145f8612a655c0580b23630de20b0fa8465d9c1"
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
