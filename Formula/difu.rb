class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.0/difu-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "a4dcbc0d4c822a1121391621046a7c98e9f184690c546d604f4b6989f1305df3"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.0/difu-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "04e802d0ef65177de4078ce65d44b4a9df6b84f94dbf877d5468ab0f2635d9fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.0/difu-0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "55b24fb7185fc0162bdd3a9d1fd058ad9db9ab9d4caaaeb6ad5cf09962dcf301"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.8.0/difu-0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ea7a28084aa8921609f3c26b4d51e212467a8cffb6980a41fb86522c01fb0e3d"
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
