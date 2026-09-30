class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.0/difu-0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "a67bed90860facabbbd4412d1fee7a03051d72b539d1d6bf6fec00fb48db43be"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.0/difu-0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "c6a3e6ca24e11fa88a9fd9fc227cd410256cbd8af25e1ed187185e24ed5f60ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.0/difu-0.17.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a694df9efedb9b1775dab2b2102ef087bb781c862b29308a58a60a39d5c4302d"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.0/difu-0.17.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dec4db1299865c2ce8cf7d0b66ea3c1d52cbb3e30d40ae9bac3d0b69a5f909d1"
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
