class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.10.0/difu-0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "5816b9421fae37300a378e0dc50fe8a94956bf454cd35a2f391606145a0773c3"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.10.0/difu-0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "f9399a9cb12c99fc83bdccef7faedc2ac3baac257522f9591b4626ed62e74bf4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.10.0/difu-0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b2b64025bd3db35d30d8b71ef5f9ce0be3a81018d16db1aa584e076f671489c8"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.10.0/difu-0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9a0081337e25454e5c8a652f625e70bd1a2eec42f46b9951897d1a3764299703"
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
