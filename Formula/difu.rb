class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.47.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.47.0/difu-0.47.0-aarch64-apple-darwin.tar.gz"
      sha256 "28bc5c8c27ac9d48277b9e2537d30459c4c6227d442e10b45d7679e096afec75"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.47.0/difu-0.47.0-x86_64-apple-darwin.tar.gz"
      sha256 "7bd56ba5101e34afeca8afdf9edab96a1dc98cf4ed7dd0ed199992481e8a8990"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.47.0/difu-0.47.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9449c638e0ac1986b7af4b50c76ea11a846e574dbabb71a82ab9aa04e675f7d4"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.47.0/difu-0.47.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "379436b8dc09c398b21b7662596aa675f014bb1ae693fc22bfbae15fb88f8b22"
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
