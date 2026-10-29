class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.33.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.2/difu-0.33.2-aarch64-apple-darwin.tar.gz"
      sha256 "9eebdd8bb2c0e5a48adb6ecef0660784e634b818d110dfdcc6b31956094b9c92"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.2/difu-0.33.2-x86_64-apple-darwin.tar.gz"
      sha256 "215eee47ab94f09cc9d4622d18e204998307f6d8abe974e8397da82e560b1b8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.2/difu-0.33.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e9b43ffba7cd9890f5bc619da4cefdad13d6ea6e5b634e3cad5367550567e91d"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.33.2/difu-0.33.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cb9e9322aab29c5017141baa05ec36b2a8db9392e98ce678c5d8d5b2fee62050"
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
