# typed: false
# frozen_string_literal: true

class Nhilens < Formula
  desc "Which AI agents and non-human identities are running in your AWS account — strictly read-only Go CLI"
  homepage "https://github.com/devel0mer/nhilens"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devel0mer/nhilens/releases/download/v0.2.1/nhilens_0.2.1_darwin_arm64.tar.gz"
      sha256 "4f0e825c475beae11fbf5fc449a11cd364330352c1daaf3b768993ab46e34769"
    else
      url "https://github.com/devel0mer/nhilens/releases/download/v0.2.1/nhilens_0.2.1_darwin_amd64.tar.gz"
      sha256 "50f606de77fd06474a817481e69890e8a5907f38952c8611cd49d45f089e9487"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/devel0mer/nhilens/releases/download/v0.2.1/nhilens_0.2.1_linux_arm64.tar.gz"
      sha256 "819487ec4ba6406a1e2f9c47ed64964667a3991e3712c61818aa6c5ff7b89901"
    else
      url "https://github.com/devel0mer/nhilens/releases/download/v0.2.1/nhilens_0.2.1_linux_amd64.tar.gz"
      sha256 "b4e1fbf9c102fc188c496ad38684967ee4f1c183ec59f1599f36e768b2c79163"
    end
  end

  def install
    bin.install "nhilens"
  end

  test do
    assert_match "nhilens #{version}", shell_output("#{bin}/nhilens version")
  end
end
