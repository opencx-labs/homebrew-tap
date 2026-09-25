class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.11.0/difu-0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "2cbbcf3d5747b8d08ac6e473d7726beb3a846f8c6ade220a9023135822dea4a9"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.11.0/difu-0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "c1f09521e1e320ff1505162def4478e3d489cea45f16f780b32c92bc8e6fb4e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.11.0/difu-0.11.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fb45cf14c653ab83060629bf46eb929e80c45d7668f315bae4b8e6209c538d29"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.11.0/difu-0.11.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9767d4e1bd5a28c84566c788dac5602542811133bd6e6f12233c4e30bb505306"
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
