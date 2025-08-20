cask "teleskopio" do
  version "0.0.5"
  sha256 "8ad4f116bfdd862598109a7841775beb56078e63daf5efa6404ce44302b78b99"

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

