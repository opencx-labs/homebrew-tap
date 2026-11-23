class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.51.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.0/difu-0.51.0-aarch64-apple-darwin.tar.gz"
      sha256 "5a5c53a32335f00db0c68d956ba0afe4021772c0e4b5f42331e85ac43967de31"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.0/difu-0.51.0-x86_64-apple-darwin.tar.gz"
      sha256 "df6497e9f67a7e505b97bad73a2238792eea6d89a1a81602e96e026b2c7869ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.0/difu-0.51.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ca5f4736fcc17b6008d5b3c54542ba58dcdc2eff8db0c6abb2729c4f6e8ff895"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.0/difu-0.51.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "46cd048e727913f80b037e8a4869b98ba9ba13487a55b8975c23e8cae5b09ae1"
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
