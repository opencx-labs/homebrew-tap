class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.41.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.41.0/difu-0.41.0-aarch64-apple-darwin.tar.gz"
      sha256 "87467d9dddf72fe4a6d07f69651987ab11d3304fb5216b80ab369e19d6eeea71"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.41.0/difu-0.41.0-x86_64-apple-darwin.tar.gz"
      sha256 "1912d4acc9a1830efd785c8157e06738c536b927b234c5eb468372ac5e288a24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.41.0/difu-0.41.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "de5190a1ccaedd64e5d4e1bfa5fa5d7d0401a575bfc951a21639c7ef4eaf9afd"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.41.0/difu-0.41.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "998c03ef321112f235143b80b574cfac588e492538bd841a04f3bbf4bd1385c9"
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
