class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.0/difu-0.32.0-aarch64-apple-darwin.tar.gz"
      sha256 "0569d026271682f6ea595a909b87bf80baa01284d34d2ccfd098914e021a3cf4"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.0/difu-0.32.0-x86_64-apple-darwin.tar.gz"
      sha256 "9740cdbcadac956a2b70525878cb5f19ce4c4025543612cb6f088de422d2cd88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.0/difu-0.32.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2fd3139ffbc31fb7a280d056eac4dfce01eb4073f8eae4b3a9e933ec36a22199"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.32.0/difu-0.32.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "13badf9ffd4da93aaf59232b4ad99acec1de436b6a91f6e46c1e71fbf1d12733"
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
