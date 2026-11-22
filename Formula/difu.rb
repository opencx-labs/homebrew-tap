class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.50.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.50.2/difu-0.50.2-aarch64-apple-darwin.tar.gz"
      sha256 "c6e3d5a8bd023bf46748d8dadce836dcb7a492b96837562beda03855317a0b29"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.50.2/difu-0.50.2-x86_64-apple-darwin.tar.gz"
      sha256 "b76556e80186aab62bdcb4a88186028b945d05beb53976b6401caeb3d687c45e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.50.2/difu-0.50.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cbb0014fa52fcd6dad41038576493ecaa7c499a4cd1f44bea5080a406fd96aa4"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.50.2/difu-0.50.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a1610c4476f9040090ff1fc21a637fa2eae1d6b8b0bd8315b06b227af0eeac07"
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
