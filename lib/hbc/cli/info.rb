class Hbc::CLI::Info < Hbc::CLI::Base
  def self.run(*args)
    cask_tokens = cask_tokens_from(args)
    raise Hbc::CaskUnspecifiedError if cask_tokens.empty?
    cask_tokens.each do |cask_token|
      odebug "Getting info for Cask #{cask_token}"
      cask = Hbc.load(cask_token)
      puts info(cask)
      Hbc::Installer.print_caveats(cask)
    end
  end

  def self.help
    "displays information about the given Cask"
  end

  def self.info(cask)
    installation = if cask.installed?
                     "#{cask.staged_path} (#{Hbc::Utils.cabv(cask.staged_path)})"
                   else
                     "Not installed"
                   end
    # TODO: completely reformat the info report
    <<-PURPOSE
#{cask}: #{cask.version}
#{formatted_name(cask)}
#{cask.homepage || 'No Homepage'}
#{installation}
#{github_info(cask) || 'No GitHub URL'}
#{artifact_info(cask) || 'No Artifact Info'}
PURPOSE
  end

  def self.formatted_name(cask)
    # TODO: transitional: make name a required stanza, and then stop substituting cask.token here
    cask.name.empty? ? cask.token : cask.name.join(", ")
  end

  def self.github_info(cask)
    cask_token = cask.token
    cask_token = Hbc.all_tokens.detect { |t| t.split("/").last == cask_token } unless cask_token.include?("/")
    return nil unless cask_token.respond_to?(:length) && !cask_token.empty?
    path_elements = cask_token.split "/"
    if path_elements.count == 2
      # eg caskroom-cask/google-chrome.
      # Not certain this form is needed, but it was supported in the past.
      token = path_elements[1]
      dash_elements = path_elements[0].split("-")
      repo = dash_elements.pop
      dash_elements.pop if dash_elements.count > 1 && dash_elements[-1] + "-" == repo_prefix
      user = dash_elements.join("-")
    else
      user, repo, token = path_elements
    end
    repo.sub!(%r{^homebrew-}i, "")
    "https://github.com/#{user}/homebrew-#{repo}/blob/master/Casks/#{token}.rb"
  end

  def self.artifact_info(cask)
    retval = ""
    Hbc::DSL::ORDINARY_ARTIFACT_TYPES.each do |type|
      next if cask.artifacts[type].empty?
      retval = "#{Tty.blue.bold}==>#{Tty.reset.bold} Contents#{Tty.reset}\n" if retval.empty?
      cask.artifacts[type].each do |artifact|
        activatable_item = type == :stage_only ? "<none>" : artifact.first
        retval.concat "  #{activatable_item} (#{type})\n"
      end
    end
    retval.sub!(%r{\n\Z}, "")
  end
end
