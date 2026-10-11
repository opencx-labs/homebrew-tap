class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.0/difu-0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "592114cbeb7dfa14f5ac97d00535537b5761ee40af97dda63072acb549cc6960"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.0/difu-0.18.0-x86_64-apple-darwin.tar.gz"
      sha256 "d14dfd6d6d8c6a8927fbd91a9bef4cefebaa3f796b7901d98b6161e5c27f29e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.0/difu-0.18.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8366461e30b0cb2e0b7dbd1d652aa6203fb797a18d99c6e0304199b93aa9da47"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.0/difu-0.18.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fe7f6659722142ee9ab2a1ad42a24d405ec51491c40ddb09a0585add5cc9bcf8"
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
