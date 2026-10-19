class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.22.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.22.1/difu-0.22.1-aarch64-apple-darwin.tar.gz"
      sha256 "8768cf60f889d4e1244618f7197f7d7d1649c1d4bc56641bdc9e6d50d0412417"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.22.1/difu-0.22.1-x86_64-apple-darwin.tar.gz"
      sha256 "3f61b755884b1d491733db71d8ddc6701057eb862467275391cbd12d73ffab5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.22.1/difu-0.22.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d49cb70ecaeae2a842c9d412235392b529f57de6231519bc13c33c399564d724"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.22.1/difu-0.22.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "58b2e1995e43036b327ad06d1449f644a80758c4c09e5ed11588c720ea5b138c"
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
