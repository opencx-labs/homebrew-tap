class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.37.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.2/difu-0.37.2-aarch64-apple-darwin.tar.gz"
      sha256 "38730b9822acd9cb138a488683460b6039f2acbf52625a1efb3ac0d136967e51"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.2/difu-0.37.2-x86_64-apple-darwin.tar.gz"
      sha256 "12dea8648bddc28f342e9ecb8963e4b8c83c877abda11f15927ab6e806853087"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.2/difu-0.37.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b82d7da95d7602d5475a2ad1d9e132c7557cadb499e6a0eb8ffe73dca8da75c0"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.37.2/difu-0.37.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a56361e62364c5ec9312aacd9c4fd3927d53bc592457fd38c01bf1623c719717"
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
