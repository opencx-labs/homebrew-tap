class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.21.0/difu-0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "ccb97cdc4856b2f62c5ff580c734303ad89ec2e974ee66eedc02ad8a693175dd"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.21.0/difu-0.21.0-x86_64-apple-darwin.tar.gz"
      sha256 "1985efebb553b8279441053a5818babb1b71b873f2ab1580dfd4877b61348857"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.21.0/difu-0.21.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6e0087253ab54beca18ca290e565028f5ed3ac2854f4b03e07858b75036ad939"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.21.0/difu-0.21.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dde2d6c4435ea8eb3c22721b5751b32c8b9e2a05726cd131006533790c03af55"
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
