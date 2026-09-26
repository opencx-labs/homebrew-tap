class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.12.1/difu-0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "6892e9c7b87b0e279bcbb4a2deebcb53e9c5a6679b9553f0edd3acd798c58de3"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.12.1/difu-0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "a44a0ed37ab604d2c4c322370d4d2611a96c65089503d685a7b07258bbe50d5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.12.1/difu-0.12.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "206ac2b842609b80f422cb6dd0ce647c93785dd73b40296b3869f075021109bf"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.12.1/difu-0.12.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2d408d1511f27ed42f9727d286cbdb31875dab68bf6c41f4aad05ae2439a1c4c"
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
