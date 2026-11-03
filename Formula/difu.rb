class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.37.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.3/difu-0.37.3-aarch64-apple-darwin.tar.gz"
      sha256 "ed2e0f649f12b3e2d18e25e7ea0eb70b946c4d854d04293c97592f6720095f64"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.3/difu-0.37.3-x86_64-apple-darwin.tar.gz"
      sha256 "9f30d3457d52657bf61514b27d271d433ddc1efc6423b8557f89fd308980ff25"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.3/difu-0.37.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a426fe79f9b71e3ae4e86635fba6addbeaf7f72c45bbec7bbe2388ae626b5b38"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.3/difu-0.37.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6cc4cdbdea121902fc992551b1b7956a2035490f07827875a6ce0a1e343dabad"
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
