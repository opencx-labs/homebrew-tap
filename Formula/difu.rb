class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.32.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.2/difu-0.32.2-aarch64-apple-darwin.tar.gz"
      sha256 "a8a8a6aef0c62bbfe3c217f6f90f7208b529dc825ffd7d623c1d1890f166a5ca"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.2/difu-0.32.2-x86_64-apple-darwin.tar.gz"
      sha256 "1387ed3a30fab61cd34f887c1a9e9b72d66c3eacdf8c39b4e39fb808b4f83641"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.2/difu-0.32.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4ccb4382e6d3f3f74732d95ab69a698055c509728924b8d42519b9b2b71377a1"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.2/difu-0.32.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ebf80a1e36bd4ebb524b54a4e9c11a748a4d2e267a0d0208e4636d7caa5ff2d7"
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
