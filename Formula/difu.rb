class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.3/difu-0.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "e0efbac3f06bbde4a0e4274c21fdf33a9a2a0eebfd3844fb120ec5f5a7d0df90"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.3/difu-0.8.3-x86_64-apple-darwin.tar.gz"
      sha256 "f8ac7005993d624f31ddc04fe5c2f733da39a8c980f8e80af30ba27145908813"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.3/difu-0.8.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "497bbb697da8ca97f4902df1ca01dfea7469c7dedff7111f8f5d37962d13922f"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.3/difu-0.8.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3c96044c41d17e76905fbbc1ef558102580c65329aba653d29bdfc25191350aa"
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
