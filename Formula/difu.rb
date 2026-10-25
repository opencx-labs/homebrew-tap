class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.26.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.26.2/difu-0.26.2-aarch64-apple-darwin.tar.gz"
      sha256 "927de15395642d322400dd40749a973ef7c00e0ac1d7ee38e3f10995c026b6e1"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.26.2/difu-0.26.2-x86_64-apple-darwin.tar.gz"
      sha256 "4cea42b7ee1b1f5425082ca9d14bd06f0317090dddd0c457ee0a6215682fc231"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.26.2/difu-0.26.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cf5a894a87681c8778b654e852be49027ef0755bd2b4c94f5d7a3333ead83249"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.26.2/difu-0.26.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cc79bc5acba07a72bffc458b12ccab87504e81a232497745dd8471d5da0195ce"
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
