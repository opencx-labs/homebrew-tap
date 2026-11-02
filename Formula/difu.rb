class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.36.0/difu-0.36.0-aarch64-apple-darwin.tar.gz"
      sha256 "56567fdf17a90f834ad9d81a35235f12325bfa1e56ed3f77c4ed168fd0d38b7d"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.36.0/difu-0.36.0-x86_64-apple-darwin.tar.gz"
      sha256 "021c25f2c37038a65a683231c45b5bdb2d273f7905c9661c7da7caed275b59f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.36.0/difu-0.36.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2758f7ba9ec73e4e2f7db19f760a379903bdfe0f01bd4982c3af42f783f3d1e5"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.36.0/difu-0.36.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b4d25932951b63adda2f61c32865fe8d0788f1551a93dd2439e35fc7643f184f"
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
