class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.37.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.0/difu-0.37.0-aarch64-apple-darwin.tar.gz"
      sha256 "39fac4a6b90b73f0b3349ed6b6fc2eabe43d220feea45c377c29533b02182e33"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.0/difu-0.37.0-x86_64-apple-darwin.tar.gz"
      sha256 "2a6a74d25ee5ef49d2359ed2045c49c74353d0f03440115fad731822690bfd66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.0/difu-0.37.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "52e13cdbbae0364143daf7d0349c05282e5744910109f782cf0d02e68b83af8f"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.0/difu-0.37.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "faa5fd9da49f97cc787a21f4108f914ef4fc6bdcc5ed51aaa662911710415e4f"
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
