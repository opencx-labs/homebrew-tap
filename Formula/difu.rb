class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.1/difu-0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "d3abd520dc35cff4540968c5cf4d1d8aba6c2cb42854266313cf22b667cfbe92"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.1/difu-0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "77af4204fd154d297127a8678e2a2e716dcda2b3eaa2e5d4aada4014b35729c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.1/difu-0.8.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "caa9cd46580aa7bddc27ad7fa721f5dfb7ec5efbb4bf5380f78bd46bbc6d2d75"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.1/difu-0.8.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f199fae51cfb949344162f3c710a84c52330d067efd196a5bf50e09009670088"
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
