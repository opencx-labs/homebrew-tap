class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.19.0/difu-0.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "afb29c0836ad95fd61b2ebe780daf35d4252f5f3afc6297d6b2e735d28ac1371"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.19.0/difu-0.19.0-x86_64-apple-darwin.tar.gz"
      sha256 "c23e9a4d9f0563edd006a27c77594e0c6492c2483a6f5a74a73aeb4877557b28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.19.0/difu-0.19.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d95b64c266ffdbf13bb8e9c965281feb40f429d4b75f36965907ec7120197792"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.19.0/difu-0.19.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f4da0995c78fda256daabd838bae325f063640666ddb6200ff10bec846e7b221"
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
