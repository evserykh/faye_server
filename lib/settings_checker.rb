class SettingsChecker
  def self.check(file)
    @settings ||= begin
                    settings = YAML.load_file(file)

                    raise if settings['mount_path'].blank? || settings['secret'].blank? || settings['redis']['url'].blank?

                    settings
                  rescue
                    abort "Can't read settings. Check file #{file} exist and contains valid settings"
                  end
  end
end
