require "set"

class Hbc::DSL; end

require "hbc/dsl/appcast"
require "hbc/dsl/base"
require "hbc/dsl/caveats"
require "hbc/dsl/conflicts_with"
require "hbc/dsl/container"
require "hbc/dsl/depends_on"
require "hbc/dsl/gpg"
require "hbc/dsl/installer"
require "hbc/dsl/license"
require "hbc/dsl/postflight"
require "hbc/dsl/preflight"
require "hbc/dsl/stanza_proxy"
require "hbc/dsl/uninstall_postflight"
require "hbc/dsl/uninstall_preflight"
require "hbc/dsl/version"

class Hbc::DSL
  ORDINARY_ARTIFACT_TYPES = [
                              :app,
                              :artifact,
                              :audio_unit_plugin,
                              :binary,
                              :colorpicker,
                              :font,
                              :input_method,
                              :internet_plugin,
                              :pkg,
                              :prefpane,
                              :qlplugin,
                              :screen_saver,
                              :service,
                              :stage_only,
                              :suite,
                              :vst_plugin,
                              :vst3_plugin,
                            ].freeze

  ACTIVATABLE_ARTIFACT_TYPES = ([:installer, *ORDINARY_ARTIFACT_TYPES] - [:stage_only]).freeze

  SPECIAL_ARTIFACT_TYPES = [
                             :uninstall,
                             :zap,
                           ].freeze

  ARTIFACT_BLOCK_TYPES = [
                           :preflight,
                           :postflight,
                           :uninstall_preflight,
                           :uninstall_postflight,
                         ].freeze

  DSL_METHODS = Set.new [
                          :accessibility_access,
                          :appcast,
                          :artifacts,
                          :auto_updates,
                          :caskroom_path,
                          :caveats,
                          :conflicts_with,
                          :container,
                          :depends_on,
                          :gpg,
                          :homepage,
                          :license,
                          :name,
                          :sha256,
                          :staged_path,
                          :url,
                          :version,
                          :appdir,
                          *ORDINARY_ARTIFACT_TYPES,
                          *ACTIVATABLE_ARTIFACT_TYPES,
                          *SPECIAL_ARTIFACT_TYPES,
                          *ARTIFACT_BLOCK_TYPES,
                        ].freeze

  attr_reader :token
  def initialize(token)
    @token = token
  end

  def name(*args)
    @name ||= []
    return @name if args.empty?
    @name.concat(args.flatten)
  end

  def homepage(homepage = nil)
    if @homepage && !homepage.nil?
      raise Hbc::CaskInvalidError.new(token, "'homepage' stanza may only appear once")
    end
    @homepage ||= homepage
  end

  def url(*args, &block)
    url_given = !args.empty? || block_given?
    return @url unless url_given
    if @url && url_given
      raise Hbc::CaskInvalidError.new(token, "'url' stanza may only appear once")
    end
    @url ||= begin
      Hbc::URL.from(*args, &block)
    rescue StandardError => e
      raise Hbc::CaskInvalidError.new(token, "'url' stanza failed with: #{e}")
    end
  end

  def appcast(*args)
    return @appcast if args.empty?
    if @appcast && !args.empty?
      raise Hbc::CaskInvalidError.new(token, "'appcast' stanza may only appear once")
    end
    @appcast ||= begin
      Hbc::DSL::Appcast.new(*args) unless args.empty?
    rescue StandardError => e
      raise Hbc::CaskInvalidError.new(token, e)
    end
  end

  def gpg(*args)
    return @gpg if args.empty?
    if @gpg && !args.empty?
      raise Hbc::CaskInvalidError.new(token, "'gpg' stanza may only appear once")
    end
    @gpg ||= begin
      Hbc::DSL::Gpg.new(*args) unless args.empty?
    rescue StandardError => e
      raise Hbc::CaskInvalidError.new(token, e)
    end
  end

  def container(*args)
    return @container if args.empty?
    if @container && !args.empty?
      # TODO: remove this constraint, and instead merge multiple container stanzas
      raise Hbc::CaskInvalidError.new(token, "'container' stanza may only appear once")
    end
    @container ||= begin
      Hbc::DSL::Container.new(*args) unless args.empty?
    rescue StandardError => e
      raise Hbc::CaskInvalidError.new(token, e)
    end
    # TODO: remove this backward-compatibility section after removing nested_container
    if @container && @container.nested
      artifacts[:nested_container] << @container.nested
    end
    @container
  end

  SYMBOLIC_VERSIONS = Set.new [
                                :latest,
                              ]

  def version(arg = nil)
    return @version if arg.nil?
    raise Hbc::CaskInvalidError.new(token, "'version' stanza may only appear once") if @version
    raise Hbc::CaskInvalidError.new(token, "invalid 'version' value: '#{arg.inspect}'") if !arg.is_a?(String) && !SYMBOLIC_VERSIONS.include?(arg)
    @version ||= Hbc::DSL::Version.new(arg)
  end

  SYMBOLIC_SHA256S = Set.new [
                               :no_check,
                             ]

  def sha256(arg = nil)
    return @sha256 if arg.nil?
    raise Hbc::CaskInvalidError.new(token, "'sha256' stanza may only appear once") if @sha256
    raise Hbc::CaskInvalidError.new(token, "invalid 'sha256' value: '#{arg.inspect}'") if !arg.is_a?(String) && !SYMBOLIC_SHA256S.include?(arg)
    @sha256 ||= arg
  end

  def license(arg = nil)
    return @license if arg.nil?
    if @license && !arg.nil?
      raise Hbc::CaskInvalidError.new(token, "'license' stanza may only appear once")
    end
    @license ||= begin
      Hbc::DSL::License.new(arg) unless arg.nil?
    rescue StandardError => e
      raise Hbc::CaskInvalidError.new(token, e)
    end
  end

  # depends_on uses a load method so that multiple stanzas can be merged
  def depends_on(*args)
    return @depends_on if args.empty?
    @depends_on ||= Hbc::DSL::DependsOn.new
    begin
      @depends_on.load(*args) unless args.empty?
    rescue RuntimeError => e
      raise Hbc::CaskInvalidError.new(token, e)
    end
    @depends_on
  end

  def conflicts_with(*args)
    if @conflicts_with && !args.empty?
      # TODO: remove this constraint, and instead merge multiple conflicts_with stanzas
      raise Hbc::CaskInvalidError.new(token, "'conflicts_with' stanza may only appear once")
    end
    return @conflicts_with if args.empty?
    @conflicts_with ||= begin
      Hbc::DSL::ConflictsWith.new(*args) unless args.empty?
    rescue StandardError => e
      raise Hbc::CaskInvalidError.new(token, e)
    end
  end

  def artifacts
    @artifacts ||= Hash.new { |hash, key| hash[key] = Set.new }
  end

  def caskroom_path
    @caskroom_path ||= Hbc.caskroom.join(token)
  end

  def staged_path
    return @staged_path if @staged_path
    cask_version = version || :unknown
    @staged_path = caskroom_path.join(cask_version.to_s)
  end

  def caveats(*string, &block)
    @caveats ||= []
    if block_given?
      @caveats << Hbc::Caveats.new(block)
    elsif string.any?
      @caveats << string.map { |s| s.to_s.sub(%r{[\r\n \t]*\Z}, "\n\n") }
    end
    @caveats
  end

  def accessibility_access(accessibility_access = nil)
    if @accessibility_access && !accessibility_access.nil?
      raise Hbc::CaskInvalidError.new(token, "'accessibility_access' stanza may only appear once")
    end
    @accessibility_access ||= accessibility_access
  end

  def auto_updates(auto_updates = nil)
    if @auto_updates && !auto_updates.nil?
      raise Hbc::CaskInvalidError.new(token, "'auto_updates' stanza may only appear once")
    end
    @auto_updates ||= auto_updates
  end

  ORDINARY_ARTIFACT_TYPES.each do |type|
    define_method(type) do |*args|
      if type == :stage_only && args != [true]
        raise Hbc::CaskInvalidError.new(token, "'stage_only' takes a single argument: true")
      end
      artifacts[type] << args
      if artifacts.key?(:stage_only) && artifacts.keys.count > 1 &&
         !(artifacts.keys & ACTIVATABLE_ARTIFACT_TYPES).empty?
        raise Hbc::CaskInvalidError.new(token, "'stage_only' must be the only activatable artifact")
      end
    end
  end

  def installer(*args)
    return artifacts[:installer] if args.empty?
    artifacts[:installer] << Hbc::DSL::Installer.new(*args)
    raise "'stage_only' must be the only activatable artifact" if artifacts.key?(:stage_only)
  rescue StandardError => e
    raise Hbc::CaskInvalidError.new(token, e)
  end

  SPECIAL_ARTIFACT_TYPES.each do |type|
    define_method(type) do |*args|
      artifacts[type].merge(args)
    end
  end

  ARTIFACT_BLOCK_TYPES.each do |type|
    define_method(type) do |&block|
      artifacts[type] << block
    end
  end

  def method_missing(method, *)
    Hbc::Utils.method_missing_message(method, token)
    nil
  end

  def appdir
    self.class.appdir
  end

  def self.appdir
    Hbc.appdir.sub(%r{\/$}, "")
  end
end
