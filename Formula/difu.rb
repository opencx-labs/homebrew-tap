class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.50.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.50.1/difu-0.50.1-aarch64-apple-darwin.tar.gz"
      sha256 "09a13c92f90435122673a720901eda4b372b758502db7dfe538ccbdcb408ec68"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.50.1/difu-0.50.1-x86_64-apple-darwin.tar.gz"
      sha256 "e122def9987e74a37e47d2188af6f2eb134f872541c64c1874963967a524fdf7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.50.1/difu-0.50.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5d309b16cd03dadd309c6bd36477e4f35ab5c7e7cd03b681c77d658c1b7b8c6d"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.50.1/difu-0.50.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "227b5edceabed7a058fa36ca7919fb08115e697b83115937f1726a1dc5289c8a"
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
