class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.32.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.1/difu-0.32.1-aarch64-apple-darwin.tar.gz"
      sha256 "ad42fb1b84761923c59239081f9baf8170fcb08ba1546a9011edda821ed7d050"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.1/difu-0.32.1-x86_64-apple-darwin.tar.gz"
      sha256 "7d8b8b5f108c748c095065b4e8ab92e4a1ef1e3c051405681cae4a23d23ff4f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.1/difu-0.32.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "62a7ea84eefcb10044e942e6f1be9ed500c3ef7e67951966424739c791c96aa1"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.1/difu-0.32.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2dc1f749dc606c58f0b27d8e7a7158d285981ac8a815270df9dd1fc4dcab9a0c"
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
