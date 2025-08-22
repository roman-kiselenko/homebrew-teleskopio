cask "teleskopio" do
  version "0.0.6"
  sha256 "606c39d128080ce6a1e38867f81642778b5e4349b58f588721d22e1d8e7ebb0b"

  url "https://github.com/roman-kiselenko/teleskopio/releases/download/v#{version}/teleskopio_#{version}_aarch64.dmg"
  name "teleskopio"
  desc "teleskopio is an open-source small and beautiful Kubernetes client."
  homepage "https://github.com/roman-kiselenko/teleskopio"

  app "teleskopio.app"

  postflight do
    system_command "codesign",
      args: ["--force", "--deep", "--sign", "-", "#{appdir}/teleskopio.app"]

    system_command "xattr",
      args: ["-d", "com.apple.quarantine", "#{appdir}/teleskopio.app"],
      must_succeed: false
  end
end

