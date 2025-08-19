cask "teleskopio" do
  version "0.0.4"
  sha256 "ae807917ab1ac6dd3182046b881b2cbf6d4bd782b400394a7f61b1ec4413e0fe"

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

