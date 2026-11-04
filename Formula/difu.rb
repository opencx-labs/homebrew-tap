class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.39.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.39.0/difu-0.39.0-aarch64-apple-darwin.tar.gz"
      sha256 "de8f2efcd2704f68dad22d816b6058f1d3594682e1677825e6fa998b3785fc3b"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.39.0/difu-0.39.0-x86_64-apple-darwin.tar.gz"
      sha256 "a24b6e51e51891c51d92d7e2df8acbf0d3906d595a37fc95e062d845c68f603d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.39.0/difu-0.39.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fdf7ef12cd8c2040ce29d8e78fcf9e0ee34c6ea2ebe918c97b18e53795250d3a"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.39.0/difu-0.39.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8d73ff694260b1591bf3f8b48155623486c6092fe65fe9fc2482f57b64a984f6"
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
