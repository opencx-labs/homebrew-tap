class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.26.0/difu-0.26.0-aarch64-apple-darwin.tar.gz"
      sha256 "71991f93c42daa6db0e8bdd0e379d7365a3fefd989f1bb20bb32ca25456f50ee"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.26.0/difu-0.26.0-x86_64-apple-darwin.tar.gz"
      sha256 "a5b57dfd5cb085b2cd99514dc00ded93a93125a41d95fd15f18fdfb8c54fe715"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.26.0/difu-0.26.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "87a52ec1b8d6e9340572ad46339a919fce72bccd21c199d1b2d47c44fd823174"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.26.0/difu-0.26.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2b31018a1bf40b08550501674b71f7964fc73f0d5501c783fb325e14ca3f1e5f"
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
