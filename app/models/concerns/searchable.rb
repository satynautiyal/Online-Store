module Searchable
    extend ActiveSupport::Concern
    included do
        include Elasticsearch::Model
        include Elasticsearch::Model::Callbacks

        index_name Rails.application.class.module_parent_name.underscore
        document_type self.name.downcase

        
        
            mapping dynamic: true do
                indexes :name
                indexes :description
            end

        def self.search(what_to_search)
        __elasticsearch__.search(
            {
                query:{
                    multi_match: {
                        query: what_to_search,
                        fields: ['name^5','descripion']
                    }
                }
            }) 
        end
    end
end