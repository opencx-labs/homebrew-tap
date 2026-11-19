class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.49.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.49.0/difu-0.49.0-aarch64-apple-darwin.tar.gz"
      sha256 "ba324e5550d4f48f1e189e43906da998dc280504858aa19f658666fded9d318f"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.49.0/difu-0.49.0-x86_64-apple-darwin.tar.gz"
      sha256 "5b02010251f29db69ff56dcb3cb542769591baaaefc2025ea4b4c65c17e12feb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.49.0/difu-0.49.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a1a393205ed5e30ebb93e55aec1119a7a5e37b132eaae9803b082ba0de565d7a"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.49.0/difu-0.49.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a50dd4fe2dd49b0e985949a05112ad9c48e2fe76a12133b48d4511e002581ad8"
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
