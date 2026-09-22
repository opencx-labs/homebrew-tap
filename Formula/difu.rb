class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.8.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.4/difu-0.8.4-aarch64-apple-darwin.tar.gz"
      sha256 "57386f91647a82e298b4f3724ebf0299c625a74fe2945e842bfe495268bd680e"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.4/difu-0.8.4-x86_64-apple-darwin.tar.gz"
      sha256 "e228bf8ba6763bbda507af5852f2536f1b4a3c244ef343c9b0d4e9512bb6cc16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.4/difu-0.8.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "14d86ba956b337f1586d6c1d63d321ca4f5df037cb5f8a6e3188d28937b075b2"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.4/difu-0.8.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4b2fa72d1e52e5a0b10784d03caa27beb708b851c38a78f7dfda9ceb45033c8d"
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
