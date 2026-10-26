class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.27.0/difu-0.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "9f0dff3620126859c454f38b079cc10c8e82778baaf3b6a14b8d4285c74c4698"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.27.0/difu-0.27.0-x86_64-apple-darwin.tar.gz"
      sha256 "4176e530ec5b20709ddce5562bf09fb5249282d2f769d06bd20eb9f93da174d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.27.0/difu-0.27.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6433e8e8ea7622ede69e52c0c48b575e629559fcb8822daac5cb8e8ce1120603"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.27.0/difu-0.27.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cb142fafb2150eecb180c4bc58aca0294fb2fb03bee81f30820033109e6075b1"
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
