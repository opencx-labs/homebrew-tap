class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.12.0/difu-0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "7339aa7831f3d1d08ef797cf7ce01fea509b1109eeb15da61d4655daf9240386"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.12.0/difu-0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "b59ffffd3252f446b9f8ba7041c7f320d70db25cd4abdd3fcbda372819c2f6bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.12.0/difu-0.12.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "659ae990491385efc24c6eeaff9f864a8799bf18a980a77159f59b5786947d07"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.12.0/difu-0.12.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d57507a50628b41af11c292dae28a482a75e6231d89da2c94a1e4f5f4a3b9cc9"
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
