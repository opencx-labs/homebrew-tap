class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.23.0/difu-0.23.0-aarch64-apple-darwin.tar.gz"
      sha256 "2d2844728c0782f12a15640d9c7d5e8a40f8c4b9599bbfbd42c3ef1124d10a85"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.23.0/difu-0.23.0-x86_64-apple-darwin.tar.gz"
      sha256 "407857a5c1213a5b5b8b9d1010779adf60bf405d0037f90ca3f57dcaa286d507"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.23.0/difu-0.23.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a521d290d6184f7a6b01a57c99cbb5eeb49168668921f50e5fe94702547c2d5d"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.23.0/difu-0.23.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "986533c580856dcff49135e7c6ec47d452be758518cce307f8df98959e782998"
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
