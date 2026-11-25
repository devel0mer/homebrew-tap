# typed: false
# frozen_string_literal: true

class Nhilens < Formula
  desc "Strictly read-only Go CLI to audit AWS non-human identities (NHI) and AI agents"
  homepage "https://github.com/devel0mer/nhilens"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devel0mer/nhilens/releases/download/v0.1.0/nhilens_0.1.0_darwin_arm64.tar.gz"
      sha256 "2b6cc4b6f32ad67633c3e434b95811d54422bb3d01aa967626d680e71cb30729"
    else
      url "https://github.com/devel0mer/nhilens/releases/download/v0.1.0/nhilens_0.1.0_darwin_amd64.tar.gz"
      sha256 "775900e91858dff4aade4e155a1f0fa139a52937a54bda7f26fc6a3f5f9410de"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/devel0mer/nhilens/releases/download/v0.1.0/nhilens_0.1.0_linux_arm64.tar.gz"
      sha256 "e024e1f60e27c56cd08edb59e5b928c81809f5e236ea13f42da8d5d52599a3e8"
    else
      url "https://github.com/devel0mer/nhilens/releases/download/v0.1.0/nhilens_0.1.0_linux_amd64.tar.gz"
      sha256 "f6291441bf6b6e801cd7ecd1de8bc0c16facf29805abcba3c3e51057df3d02da"
    end
  end

  def install
    bin.install "nhilens"
  end

  test do
    assert_match "nhilens #{version}", shell_output("#{bin}/nhilens version")
  end
end
