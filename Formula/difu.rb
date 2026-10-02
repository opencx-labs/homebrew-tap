class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.17.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.2/difu-0.17.2-aarch64-apple-darwin.tar.gz"
      sha256 "d8273eee843f0fe66614a39aec3807470d94a1aa6d0b7b36b302301bb21cad0d"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.2/difu-0.17.2-x86_64-apple-darwin.tar.gz"
      sha256 "de46135565c8aebe95496a175b3a9aed083d7542123be238d8500e78d0df0465"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.2/difu-0.17.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e70021da39184e762b15c9fadab08413f678173b3e7d267169f32d72705b8a83"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.17.2/difu-0.17.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ec33e3edc3006306c855d23970227de8468033d0d787a21837912eb1aa1b6288"
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
