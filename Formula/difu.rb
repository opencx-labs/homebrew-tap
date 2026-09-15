class Difu < Formula
  desc "Terminal pull request reader with AI-generated review guides"
  homepage "https://github.com/opencx-labs/difu"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.0/difu-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "06ad5e7942486b84f4ee80efcb2f82e1a5c6814029785127081aaa49a3e1020d"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.0/difu-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "ca7002c2bb0778cce88a6ff479fe8065d732d7dd89f87b989f20e8007b6c4d9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.0/difu-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d8bff871d0fde814671b9bf5d4bbe6bbfefd73424fbd43d26c4c7ef69e605581"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.0/difu-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8a5bce8bae87aa1b025f6350088e5a76aaf9231470be7e5a678a0e6e49e9feb4"
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
