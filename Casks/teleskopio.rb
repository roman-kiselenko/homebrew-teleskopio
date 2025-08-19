cask "teleskopio" do
  version "0.0.1"
  sha256 "sha256:889d0ce2a6035aa59f4c3ca789c1620dadf4e76f6936aae134191bad94519179"

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

