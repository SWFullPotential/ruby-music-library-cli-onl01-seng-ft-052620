  
module Concerns
  module Findable
    def find_by_name(name)
      self.all.find {|obj| obj.name == name}
    end

    def find_or_create_by_name(name)
      if obj = self.find_by_name(name)
        obj
      else
        self.create(name)
      end
    end
    def alphabetized
      self.all.sort {|x, y| x.name <=> y.name}
    end

  end

  module Creatable
    module InstanceMethods
      def save
        self.class.all << self
      end
      
    end
    module ClassMethods
      def destroy_all
        self.all.clear 
      end
      def create(name)
        self.new(name).tap{|obj| obj.save}
      end

    end

  end

end