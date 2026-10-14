class Difu < Formula
  desc "Codex agents and guided pull request reviews in the terminal"
  homepage "https://github.com/opencx-labs/difu"
  version "0.18.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.5/difu-0.18.5-aarch64-apple-darwin.tar.gz"
      sha256 "cd3f7dda275528c0f8df5e2cb32afb5f53fc0131a2956b6283e86f727f5407c5"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.5/difu-0.18.5-x86_64-apple-darwin.tar.gz"
      sha256 "8b091db2df41b9a4f3f3f7637f21c9a3c448afdeef72204b8a78ae8e09f7fe0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.5/difu-0.18.5-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7d23064ed30241b08aaa7ea3e691b67f9c3dc73d0e64e5c834084f6953d3d490"
    end
    on_intel do
      url "https://github.com/opencx-labs/difu/releases/download/v0.18.5/difu-0.18.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a83e049848edd8fa83101ca8f55d9d072e92b301a8af569cee1fc80d7360c355"
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
