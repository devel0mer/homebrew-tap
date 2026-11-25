# typed: false
# frozen_string_literal: true

class Nhilens < Formula
  desc "Strictly read-only Go CLI to audit AWS non-human identities (NHI) and AI agents"
  homepage "https://github.com/devel0mer/nhilens"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devel0mer/nhilens/releases/download/v0.2.0/nhilens_0.2.0_darwin_arm64.tar.gz"
      sha256 "fe2eed22909ee03470e8dfe779058c40e6d240c038a21ce95cc170bdb15328c6"
    else
      url "https://github.com/devel0mer/nhilens/releases/download/v0.2.0/nhilens_0.2.0_darwin_amd64.tar.gz"
      sha256 "d4a77b0098b5b2c9c9b45d67989267071f08ae04c4d96e8d4297c8ba045fb84a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/devel0mer/nhilens/releases/download/v0.2.0/nhilens_0.2.0_linux_arm64.tar.gz"
      sha256 "c8398fa5562f3c54532becb6746374b4d2318d45eae1f6c21d869f88f3af577e"
    else
      url "https://github.com/devel0mer/nhilens/releases/download/v0.2.0/nhilens_0.2.0_linux_amd64.tar.gz"
      sha256 "71879733e3f88a640ac7f458ed94a5d02507f5b400442c10c5c785f8c28feade"
    end
  end

  def install
    bin.install "nhilens"
  end

  test do
    assert_match "nhilens #{version}", shell_output("#{bin}/nhilens version")
  end
end
