class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.31.0/difu-0.31.0-aarch64-apple-darwin.tar.gz"
      sha256 "16ca41f2b76f4363cd1b8b98d683720909b90121d05130077cf26ec9100111a1"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.31.0/difu-0.31.0-x86_64-apple-darwin.tar.gz"
      sha256 "ce085d2fe49c6428b5bf0d2946d224e46ec1ba47760d018e6606f0f12634f12b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.31.0/difu-0.31.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "96e6b3851133391a4ddc62b939425087056e4fcfeb48fbb41d2a6fd4e967d980"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.31.0/difu-0.31.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0b1eccb20a837beb8a1008789394c0d12ea8a521eef9804df35a9edda88800d1"
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
