module Items
  class Save
    attr_reader :item, :errors

    def initialize(
      name:,
      category:,
      quantity:
    )
      @name = name
      @category = category
      @quantity = quantity

      @errors = {
        name: [],
        category: [],
        quantity: []
      }

      @num_errors = 0
    end

    def execute!
      validate!
      
      if valid?
        @item = Item.new(
          name: @name,
          category: @category,
          quantity: @quantity
        )

        @item.save!
      end
    end

    def valid?
      @num_errors == 0
    end

    def validate!
      if @name.blank?
        @errors[:name] << "required"
        @num_errors += 1
      end

      if @category.blank?
        @errors[:category] << "required"
        @num_errors += 1
      end

      if @quantity.blank?
        @errors[:quantity] << "required"
        @num_errors += 1
      end
    end
  end
end
