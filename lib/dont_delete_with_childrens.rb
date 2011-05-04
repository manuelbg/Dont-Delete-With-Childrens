# DontDeleteWithChildrens
module DontDeleteWithChildrens
  def self.included(base)
    base.send :extend, ClassMethods
  end
  module ClassMethods
    # any method placed here will apply to classes, like Hickwall
    def dont_delete_with_childrens
      before_destroy :validate_childs
      send :include, InstanceMethods
    end
  end
  module InstanceMethods
    def validate_childs
      self.class.reflect_on_all_associations(:has_many).each do |rel|
        if rel.name.to_s != "slugs" and self.send(rel.name).count > 0
          return false
        end
      end
    end
  end
end
ActiveRecord::Base.send :include, DontDeleteWithChildrens