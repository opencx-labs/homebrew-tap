class Difu < Formula
  desc "Terminal pull request reader with AI-generated review guides"
  homepage "https://github.com/opencx-labs/difu"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.1.0/difu-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "add82efa1156f0b87baaff27490a6a393483f2ea78e1a23cf35518e3c0d169b4"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.1.0/difu-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "05fd269da5fc21a776d36b4d04c9bf9a65b6f561e1fa736880ad50ac6d342f7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.1.0/difu-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7a96531c882150021b3e3954a527606aa46dcd5ca937e28466cbf8b388c9a759"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.1.0/difu-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1a805abc5c25227a32e77518ba81d2444a2799361147146aa9472adb097d1f88"
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
