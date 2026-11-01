class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.34.0/difu-0.34.0-aarch64-apple-darwin.tar.gz"
      sha256 "516c54d5bbd689af5272d183b1ce77a92f683bc7e8140315bc2d9b5378dacb89"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.34.0/difu-0.34.0-x86_64-apple-darwin.tar.gz"
      sha256 "b73a3e946491be9a9938c43067e23cc3629414ec165ea294e460e8b35412a9f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.34.0/difu-0.34.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bb3eba59de3957c5acecb52f07d6051e8203ce1f6d1b949505013b74eee21733"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.34.0/difu-0.34.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ad05e5b732ba1ae5da8c5869efa17f7fc200e10c8764a8a46d4c2f383eb0709f"
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
