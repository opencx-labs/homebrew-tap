class Difu < Formula
  desc "Terminal pull request reader with AI-generated review guides"
  homepage "https://github.com/opencx-labs/difu"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.4.0/difu-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "914a48ebbab7650ad45726afd5c380627285991ead6033101fc9c5a4ce5a9525"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.4.0/difu-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "4dabf875783546bf0b665313e3c338ba236ead2db212ced196ffd6b479c7279c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.4.0/difu-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5e44b2b8e2f0e816e878fd1c7d1e1ec0818fbbf9a5579a98f4455b70e3440d89"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.4.0/difu-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "71b6f840195a7071f6b5109e14e4c1e30e4303f33e7983f8932ca4b8feeaf080"
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
