class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.51.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.1/difu-0.51.1-aarch64-apple-darwin.tar.gz"
      sha256 "d0d6a79732d1e79506d8ea9da93023d7198b5d861dce52d8c249e7f65f079a79"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.1/difu-0.51.1-x86_64-apple-darwin.tar.gz"
      sha256 "f817d8b9969789216b8705e5b6b3ee52c35d5ff7534fcc33224c1b715d05e0c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.1/difu-0.51.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2d5005bbed1b88fc601e238a7eea060ad79fe9f3f996af166e531cabd089f7d9"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.1/difu-0.51.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ba39fc3f0e38a3782fd3a66eae8940ce2bc3a1a524aa1be8d55661484d856d00"
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
