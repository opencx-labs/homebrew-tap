class Difu < Formula
  desc "Terminal pull request reader with AI-generated review guides"
  homepage "https://github.com/opencx-labs/difu"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.6.0/difu-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "b6bf65ca362ef6ea1ed0ca9316d83aae87bddb42f070dddd8db4c24666500151"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.6.0/difu-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "4f805e3f66e602359eadc9ce52550a0203e96675140ccba382d01a11e671c2e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.6.0/difu-0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "320c1d8823902d686777f376f6e7242f095660f0b4d996d61666b2d64cfad443"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.6.0/difu-0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d355628cd141c2976ea12da19370b27e88f8bf1808e9f6fbe8af974d70513efc"
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
