class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.22.0/difu-0.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "9cb6ef2ce0bb8ba62907fbc2300ab3abef2d8b0d785290c77dff18861c08595b"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.22.0/difu-0.22.0-x86_64-apple-darwin.tar.gz"
      sha256 "3915330b5df552e7ad6b789b6bfecbb78075900772a0334a199ddcb27d596a7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.22.0/difu-0.22.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b32d3a79f3cbba15f26daff81f973f0ec0f1f8d5d9a9f94dc41bc277bfdbe5d8"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.22.0/difu-0.22.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7c527ada3eac32f91684d0265a18e5dd12f2cdf9a2a6fc5fe6d2aa1e9cae9118"
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
