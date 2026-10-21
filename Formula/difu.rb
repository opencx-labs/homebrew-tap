class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.25.0/difu-0.25.0-aarch64-apple-darwin.tar.gz"
      sha256 "7ec47586792a28565d46dee463cf5339d323ca191183a79ed9eb531acb2e84ca"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.25.0/difu-0.25.0-x86_64-apple-darwin.tar.gz"
      sha256 "ef341bbb00b999c8566ac4152663fdeea555552bb3bb5631d757c69bebd64244"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.25.0/difu-0.25.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8503d35f1c11c91289b35f5244fd05bd07cf1e7a3649941e80cd69b4c73f3a10"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.25.0/difu-0.25.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b083836d1cf19ad03bb77e51cba6d739b32d429b6a226115859a60982f1b2207"
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
