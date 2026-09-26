class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.13.0/difu-0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "ca497ffa15e0ffb90f9e911f39040de8398ae139a6b147908507ba891dc554ef"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.13.0/difu-0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "38eb75151a37845e592f914d4b8bd12fd1c72407ed48d5bf37ce8605a65c5b67"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.13.0/difu-0.13.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7c883c448d53f7f420a60252cbd5dfe3ff6f9470b815babc41c3d0e9d5e0766e"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.13.0/difu-0.13.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9182243188335bc428971a175f27d3d4d123e87ec631d68e58eb2a8a7db184ac"
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
