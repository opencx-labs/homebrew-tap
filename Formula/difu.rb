class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.32.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.3/difu-0.32.3-aarch64-apple-darwin.tar.gz"
      sha256 "e6e51f762b36010c397d3ea7a5bc0b287346da62b55399b12e85bb8bae4f9c93"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.3/difu-0.32.3-x86_64-apple-darwin.tar.gz"
      sha256 "89383b19ba7b027726b6c14f49dee157094ad14e90a9a08dfa9a91965ddf42c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.3/difu-0.32.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1660caa36c24ee45ee685193e963ec10b8afc2d8902651d317a18fe6e8779ce4"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.3/difu-0.32.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "975c11b724eb339706947851f8d2d6f36963bf2b2d7c291c7d4fa27dec735ee6"
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
