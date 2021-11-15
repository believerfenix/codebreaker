# frozen_string_literal: true

module Codebreaker
  class Storage
    attr_accessor :data

    def initialize
      @data = db_initialized? ? load : initialize_db
    end

    def save
      store = YAML::Store.new(storage_path)
      store.transaction { @data.each { |key, value| store[key] = value } }
    end

    private

    def db_initialized?
      Dir.exist?(Constant::STORAGE_DIRECTORY_CONSTANT) && File.file?(File.join(Constant::STORAGE_DIRECTORY_CONSTANT,
                                                                               Constant::STORAGE_FILE_CONSTANT))
    end

    def initialize_db
      Dir.mkdir(Constant::STORAGE_DIRECTORY_CONSTANT)

      store = YAML::Store.new(File.join(Constant::STORAGE_DIRECTORY_CONSTANT, Constant::STORAGE_FILE_CONSTANT))
      store.transaction { standard_data.each { |key, value| store[key] = value } }

      standard_data
    end

    def standard_data
      {
        user_statistics: []
      }
    end

    def storage_path
      File.join(Constant::STORAGE_DIRECTORY_CONSTANT, Constant::STORAGE_FILE_CONSTANT)
    end

    def load
      store = YAML::Store.new(storage_path)
      store.transaction { store.roots.to_h { |key| [key, store[key]] } }
    end
  end
end
