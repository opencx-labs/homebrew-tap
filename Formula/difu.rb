class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.51.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.2/difu-0.51.2-aarch64-apple-darwin.tar.gz"
      sha256 "ee240a1667fb0d007fb6d021c12a18bf86282ba4eb37c8c7d9ba3ac1b576b417"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.2/difu-0.51.2-x86_64-apple-darwin.tar.gz"
      sha256 "8871cd1dcfbb621bca1cb04837349fc4a0f1f1af342e0ffd794852feb9e94f94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.2/difu-0.51.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9f75b4b8ffc6be22f8133d32fe3880aa15dd783dd67739d167dcf15e0174d3d4"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.2/difu-0.51.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d7941fa62ab7ef39afc1f198b369851d6bee2882f6fa21eaa7f863971022c550"
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
