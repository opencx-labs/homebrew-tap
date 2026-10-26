class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.27.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.27.1/difu-0.27.1-aarch64-apple-darwin.tar.gz"
      sha256 "36cd06a50756cca81f5fddbb40fea1cb6d2cffe77d09181108b9f91c410e715b"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.27.1/difu-0.27.1-x86_64-apple-darwin.tar.gz"
      sha256 "a817489ebad86c020294e0a3eab703f9b2f7db51101798bb27b5a0177668219f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.27.1/difu-0.27.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9415f787cdc8ec65b0636b4ceafe788d48037e2f7807850718e56fd683154987"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.27.1/difu-0.27.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "efcbc3861371b1bb083b6123deac6ad1e45692e861a0a5203963f9c68a22857a"
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
