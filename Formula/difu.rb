class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.1/difu-0.17.1-aarch64-apple-darwin.tar.gz"
      sha256 "6748f8ff9d73b89311e76342c6a65252ec843f5dbf60b05f81b3d92977c42eb9"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.1/difu-0.17.1-x86_64-apple-darwin.tar.gz"
      sha256 "25df5e539acfd8228745faf42b35c6948246c705958e6d06a1ab91eebf822854"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.1/difu-0.17.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bbf57473f3a3d6631eaf229f693237c7728f05ab9049b1901439caabe9e7e351"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.1/difu-0.17.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "36f6a73f8dced177efc4449bc1d28fbe51602bbe04ddbdb0f47de92fda5bfc0a"
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
