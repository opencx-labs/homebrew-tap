class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.14.0/difu-0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "71360513a50e27d39b55d0da41b28b6e7230c64bc39b0da0bf6f112079865752"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.14.0/difu-0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "dad91008aab34df758fca50fbb3434ed4326fa070e45ad4a4a8f96011fc13ec2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.14.0/difu-0.14.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "81a28d751281361eb20d9236fdfb2039fc3b4423bafd2b566363e68dda7d8118"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.14.0/difu-0.14.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "451c6b7f8ecc5aec93674437f21d8c3ab4b952821e31d40af5965c8971999de7"
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
