class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.26.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.26.1/difu-0.26.1-aarch64-apple-darwin.tar.gz"
      sha256 "b4a79cfa93c1a3e75c88cba5f9c1611ff529828d9a6df300c423f449b0bf62ea"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.26.1/difu-0.26.1-x86_64-apple-darwin.tar.gz"
      sha256 "35482c151ddb5ef8a5539ece2fa89c4c87b56a1f8150d705a321fabf86904f07"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.26.1/difu-0.26.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "449c893229560d7372800159dc2be2b8fe55143b14761210efbbcfcf33318f2c"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.26.1/difu-0.26.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e04128f391dca450df4f04862792f6c09a4665c372aad2dc4ca22974b2b77e9c"
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
