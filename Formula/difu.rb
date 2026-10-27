class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.30.0/difu-0.30.0-aarch64-apple-darwin.tar.gz"
      sha256 "8fbdba2ca40c0e31cd32384a686696e1dffefb4681ddc510278c69f0ccca1c5d"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.30.0/difu-0.30.0-x86_64-apple-darwin.tar.gz"
      sha256 "2db24cea9b8e6013d11a8e2b54bd4d009fef8d862136b0be09affc43d583f9e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.30.0/difu-0.30.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4f29639bed91f6c7368ee74c92ecdcbb56a8606ddc95f2da63aece7ed9ace048"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.30.0/difu-0.30.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1c017e01080e21925a4b25598e391246a969367b3882ea5eb7c9b43be3f01e72"
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
