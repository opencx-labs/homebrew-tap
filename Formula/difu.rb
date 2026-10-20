class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.24.0/difu-0.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "3b315ef91fadfab0de7cb236736eae16455f70a2a545a873f5f8d3330bd7d4f3"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.24.0/difu-0.24.0-x86_64-apple-darwin.tar.gz"
      sha256 "d17b0c936da443a62b71d0acea965fca43687fa01aa67b422e3a0cf390fc35ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.24.0/difu-0.24.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "649f66d2bc55d64ee4c4b38d087ea8550df3a3d8a9d92a070c2020c0408b9952"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.24.0/difu-0.24.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a5a9cf638289e66ad816fe08d8ad9b9a16145f3788b68c9b7cc5e2fe641faf70"
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
