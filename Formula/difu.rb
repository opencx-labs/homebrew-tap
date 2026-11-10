class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.45.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.45.0/difu-0.45.0-aarch64-apple-darwin.tar.gz"
      sha256 "5b606365e30062736dc06956293ccc55308cbf8396ac0ca04fff34901dbd990d"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.45.0/difu-0.45.0-x86_64-apple-darwin.tar.gz"
      sha256 "39d91aad39cec6d5e7d9af51965c218bc14fae6c889da803cbfbacd4ba8bd5ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.45.0/difu-0.45.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "323922e2bee93b693283f018209935f466310b8b36ed9a860138cb4f06a10658"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.45.0/difu-0.45.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "33abdb1c348183cf285864963e3f3d76f371c964ae859cf674cc7bbaa61c09fe"
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
