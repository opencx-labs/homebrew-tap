class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/homebrew-tap"
  version "0.43.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.43.0/difu-0.43.0-aarch64-apple-darwin.tar.gz"
      sha256 "b4eba8850ed0ef4fedbd41526dd15c18843ab039d76b264f802e110841d6d8fb"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.43.0/difu-0.43.0-x86_64-apple-darwin.tar.gz"
      sha256 "30aa055e99f0e3d14905d6ca303abe029561a2ea4cd771c2cd3fd718cfda5c57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.43.0/difu-0.43.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ea20d7587d074483b99328a22800fbd0408dd534ca1e815afc1a9f044c932ce6"
    end
    on_intel do
      url "https://github.com/opencx-labs/homebrew-tap/releases/download/difu-v0.43.0/difu-0.43.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "24f2a5acacf016ed63f4b8acac31893d7eadbe54c4c67657385dd010d042e5b6"
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
