class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.20.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.20.2/difu-0.20.2-aarch64-apple-darwin.tar.gz"
      sha256 "6417e007051834a971d0ff722dd1b66b2859b736c29005f24dd3d2775ce153c4"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.20.2/difu-0.20.2-x86_64-apple-darwin.tar.gz"
      sha256 "022f9fe7c7f07eaca7a11f0a3d857356dd5b0cbd0b8dd0dfd2a6ccb034b0989a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.20.2/difu-0.20.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4d46f7295843549e75883d90fc38a6e5d32c0878b76c636075089e7b0c941eeb"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.20.2/difu-0.20.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6e3369660cfa97fbdb0097bd71ace571295d3c7649e288645f4f175af812a792"
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
