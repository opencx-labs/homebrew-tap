class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.42.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.42.0/difu-0.42.0-aarch64-apple-darwin.tar.gz"
      sha256 "982d031f4dff768f88ea65e8ab5447dbdee376536bbc4297a307d786665ad8ed"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.42.0/difu-0.42.0-x86_64-apple-darwin.tar.gz"
      sha256 "cb14f046f1bb77152bab95392ad253dea6a47bd63d6180387b5deb607b4cbaaf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.42.0/difu-0.42.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "35af982539f5b5d7dee33a980b101f285286cc335e8341ea5afc1a39661c3246"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.42.0/difu-0.42.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7278272958b6570c54b6db25eba8e75dda36c1d5b38a9c2bf56bf71d4880d839"
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
