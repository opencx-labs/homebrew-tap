class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.17.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.3/difu-0.17.3-aarch64-apple-darwin.tar.gz"
      sha256 "6bb9707d08c768f3b3fb810d116151b9d789d422e28610e3ddecf07831dc5988"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.3/difu-0.17.3-x86_64-apple-darwin.tar.gz"
      sha256 "588c4c3ed5117fee1c7cc90b634167792dce70d8d91702f8df048a40c86a0bdc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.3/difu-0.17.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "225a330c9b4ae8c00e4f63ce3659bed82fd8349d2ad8fcd0c0867fe762ddf46e"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.3/difu-0.17.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d2c3153a1ddae138f8e64ac86dcbefab001a57f2203314cd50456aa82aac0b4f"
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
