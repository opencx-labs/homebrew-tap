class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.10.1/difu-0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "c13c31721edc3cae4b63a6a953941d067fc181e8b7e9abde990fba95b48c9cad"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.10.1/difu-0.10.1-x86_64-apple-darwin.tar.gz"
      sha256 "43c70fab3fa9eaff749230778f9ed40a4f4041a947057cbd4cdd9f56528fc384"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.10.1/difu-0.10.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bec8bf2f96b6b623b323862ec36cb27730968abc838c773a4cfd217ece1c0f59"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.10.1/difu-0.10.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c1df07eb545ffe64aa20aa78d25394e914673eae1353793d4b07855b32785364"
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
