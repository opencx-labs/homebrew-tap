class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.51.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.3/difu-0.51.3-aarch64-apple-darwin.tar.gz"
      sha256 "98efc832fffedaca7c24b47c80153da808f7a4d75aa4da4043a52ed70b4c3531"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.3/difu-0.51.3-x86_64-apple-darwin.tar.gz"
      sha256 "138d9414a4cff39b5639f1f1263a4d680756b951feed507042d74b1a4bba3d1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.3/difu-0.51.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f4ab884997e58421fe90761560644253a9a01471f5cd762e81ea091317dbdaf0"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.51.3/difu-0.51.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b1856ffc0015455f693c128f8f3f48824c33645e2d07a486244279f55556f535"
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
