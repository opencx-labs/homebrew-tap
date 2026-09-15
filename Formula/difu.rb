class Difu < Formula
  desc "Terminal pull request reader with AI-generated review guides"
  homepage "https://github.com/opencx-labs/difu"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.3/difu-0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "a8ab5e3eecb835584964cbc9ed1fd6c646b15ad8fcd8371fb31b897701b35280"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.3/difu-0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "32cf2110d2bc5e91adb772254b89d52dbf0d6537f257c35feafb4db3802b1b42"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.3/difu-0.2.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "043cf1973b37f2fe3e21bf46077b916d65b0ea1e92eb90ff2c6c3f6104358632"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.3/difu-0.2.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "016b48a3f086f512d6d777703d880f75b50e88a32f5c6aabb785da7452256149"
    end
  end

  def install
    bin.install "difu"
  end

  def caveats
    <<~EOS
      Git, GitHub CLI (gh), and Codex CLI must already be on your PATH.
      Authenticate if needed with `gh auth login` and `codex login`.
      Run `difu` to open your review inbox.
    EOS
  end

  test do
    assert_match "difu #{version}", shell_output("#{bin}/difu --version")
    assert_match "difu needs an interactive terminal", shell_output("#{bin}/difu 2>&1", 1)
  end
end
