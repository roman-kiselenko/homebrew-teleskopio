cask "teleskopio" do
  version "0.0.6"
  sha256 "3221da03b9c1fb1e2f8ff55c68cf564c3d1485084f0689c064ce9d170932adf0"

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

