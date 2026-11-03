class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.37.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.1/difu-0.37.1-aarch64-apple-darwin.tar.gz"
      sha256 "2027e82c23e40b5b39a1aea7eb762f0f8044b4e32018cea2e392150fbf3745fe"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.1/difu-0.37.1-x86_64-apple-darwin.tar.gz"
      sha256 "d86be7089f19674b2ab6375ee693ac4bf06d7e97478ae15f30917ab69ac2aa00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.1/difu-0.37.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9752ca01b530221c4355a50b34d262773e32698b17589d31d1404dc4509c55eb"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.1/difu-0.37.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8032eb6a181ed35213b974fbea94e5a9539d70f528a50d9d859990176c88b7f2"
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
