class Difu < Formula
  desc "Terminal pull request reader with AI-generated review guides"
  homepage "https://github.com/opencx-labs/difu"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.2/difu-0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "2e5369e286861f16b5f0d7fb88b864b15e3d15994c264681371cd285fba18328"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.2/difu-0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "ed0a71f7ab3b8705d16cb66ad1a5b2ce1bc0749e781fb32095c01302dbda330a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.2/difu-0.2.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f733b93dd421044262158a673ede51b40495dbdda3adab6e6aebc7679c743fc4"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.2.2/difu-0.2.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "605100761ef004c9d968d641df56913df54eeb3a83d09da4823d6416ab94d52b"
    end
  end

  def install
    bin.install "difu"
  end

  def caveats
    <<~EOS
      Git, GitHub CLI (gh), and Codex CLI must already be on your PATH.
      Authenticate if needed with `gh auth login` and `codex login`.
      Run `difu` to open your review inbox.
    EOS
  end

  test do
    assert_match "difu #{version}", shell_output("#{bin}/difu --version")
    assert_match "difu needs an interactive terminal", shell_output("#{bin}/difu 2>&1", 1)
  end
end
