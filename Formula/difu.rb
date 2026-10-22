class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.25.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.25.1/difu-0.25.1-aarch64-apple-darwin.tar.gz"
      sha256 "462d8c4c93253b7d0ad0db42eeef00601350917239d973e2c07923074cbce3fe"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.25.1/difu-0.25.1-x86_64-apple-darwin.tar.gz"
      sha256 "ae63a8d2921ef8bee862d0b962cd27b33ad2fa51621a030f39dd1de0f80c8847"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.25.1/difu-0.25.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7ccbf019cf2ed7e94f6c2c43e960aa900d117bc6d5e72471c8cb65bb717f7eef"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.25.1/difu-0.25.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "642828ee0992be5db2675b3bb2440b697cd65e02f686eed51add42f9a5641804"
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
