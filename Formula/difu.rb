class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.20.0/difu-0.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "6d3038293c296b1ed0b2ed046eebd83c9ce48712da344cdc7cf4baaa3c9a7895"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.20.0/difu-0.20.0-x86_64-apple-darwin.tar.gz"
      sha256 "3a0ab7318e57fcebac3dd511fe51f58dd985bfc543406ae2ab3f09f4c38a7610"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.20.0/difu-0.20.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c462e29fc14bd9b08b05574ebab366fb71ada8e9056a753ab486deb30ee655a5"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.20.0/difu-0.20.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f398eefdd2059449735798ee9fe26401a1794b5cb234c68177afa615ca94e57b"
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
