# DontDeleteWithChildrens
module DontDeleteWithChildrens
  def self.included(base)
    base.send :extend, ClassMethods
    base.send :include, InstanceMethods
  end
  module ClassMethods
    # any method placed here will apply to classes, like Hickwall
    def dont_delete_with_childrens(childs)
      before_destroy {|r| r.validate_childs(childs)}
    end
  end
  module InstanceMethods
    def validate_childs(childs)
      childs.each do |rel|
        if rel.to_s != "slugs" and self.send(rel.to_s).count > 0
          return false
        end
      end
    end
  end
end
ActiveRecord::Base.send :include, DontDeleteWithChildrens