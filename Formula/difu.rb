class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.48.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.48.2/difu-0.48.2-aarch64-apple-darwin.tar.gz"
      sha256 "6c338450e1efa2222681160c5b798efdb3bfcd70d4beef3479fe29756147a550"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.48.2/difu-0.48.2-x86_64-apple-darwin.tar.gz"
      sha256 "1cbfc8ea1690b577b1230e764865f308b3b2d40775a68ae77e6cfa89011645af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.48.2/difu-0.48.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cf56ce11dec67ab5c2eb924a072e92b7387d17028959517e9ec0827b134e9cd3"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.48.2/difu-0.48.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0209089ba0b4f1abd1d6d9177f5f06dfc3d0a632a25dec9db0b0ad9736520237"
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
