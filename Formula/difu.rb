class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.18.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.4/difu-0.18.4-aarch64-apple-darwin.tar.gz"
      sha256 "209e3012bb03614a09b041f2926b813dd96ea4585c4179f52e4cac21df7e779f"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.4/difu-0.18.4-x86_64-apple-darwin.tar.gz"
      sha256 "c3c3d10f109b2dc73b2385706d9c6116e483cf55f41ce47dae26314e00659523"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.4/difu-0.18.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3511e79bee80a697c832084616cf24df338b12136c6d25d8e93c55179f1ba40b"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.4/difu-0.18.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "19f95ff61758d83106f001947b3095e66898e20ce9448e1be10382b979f4c9c6"
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
