class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.18.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.2/difu-0.18.2-aarch64-apple-darwin.tar.gz"
      sha256 "a401697289319646a05a3bc2171958f8c973efe305e60934f09d52320a745aca"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.2/difu-0.18.2-x86_64-apple-darwin.tar.gz"
      sha256 "d151f59d36081096e2612d0068f7667824f8dbfb84fb9b2febbe11c28f0393bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.2/difu-0.18.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d50085b5aedd905cc11506df3bdf8f78e484693882044751aefb4523a7ac5860"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.2/difu-0.18.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2250524109ecba27b64f7659cfab6732dacf522ae75711b6965271b59ed5bc9f"
    end
  end

  def install
    bin.install "difu"
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
