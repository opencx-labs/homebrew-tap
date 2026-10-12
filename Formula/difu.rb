class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.18.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.3/difu-0.18.3-aarch64-apple-darwin.tar.gz"
      sha256 "f4fbb5b2c64c3cc4761ff55e841c3ae3f2c86972cda51b6076b3961ca764c1ed"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.3/difu-0.18.3-x86_64-apple-darwin.tar.gz"
      sha256 "2fd2daefdb5cc2ac7adc708ba82e9c127e1d90d75209fb05b64acb592cfe3730"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.3/difu-0.18.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1aa554c3ec8fdcc2894c741cddb4b597ff9607e04b5969e28b917300451b5d99"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.3/difu-0.18.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a09f46d6d6628ee3a0827a6d34a5dcb3315495934045cf7d4a10f8a28d7af308"
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
