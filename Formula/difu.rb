class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.16.1/difu-0.16.1-aarch64-apple-darwin.tar.gz"
      sha256 "802181a02c6327c5b893051dad8f6aad9d39f011003f646ff22ad38a7f171c2d"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.16.1/difu-0.16.1-x86_64-apple-darwin.tar.gz"
      sha256 "d69b205373dc11a8543c1e408e0dcfab7ba6ac39d6c4b1a3fa990d10ca6b965e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.16.1/difu-0.16.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c4d237e78a05d933e8a2bae8860cdc070d02f45908d1c0465568d7fa4df04956"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.16.1/difu-0.16.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6a52323f2b44d31cc1092900070446e82cd18dd6bb065e60843c1a3536b09016"
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
