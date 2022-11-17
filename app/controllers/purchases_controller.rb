class PurchasesController < ApplicationController
    def index
        @category_id = params[:category_id]
        join = CategoryPurchase.where(category_id: @category_id)
        purchase_ids = join.pluck(:purchase_id)
        @purchases = []
        purchase_ids.map do |id|
          @purchases << Purchase.find(id)
        end
        @purchases = @purchases.sort_by(&:created_at).reverse
        # @purchases = join.where()where(author_id: current_user.id).order(created_at: :desc)
        @total = @purchases.map(&:amount).inject(0, &:+)
      end
    
      def new
        @purchase = Purchase.new
      end
    
      def create
        category = Category.find_by_id(params[:category_id])
        @purchase = category.purchases.new(purchase_params)
    
        if @purchase.save
          join = CategoryPurchase.create(category_id: category.id, purchase_id: @purchase.id)
          if join.nil?
            flash[:alert] = @purchase.errors.messages
            render :new
          else
            redirect_to category_purchases_path(category.id)
          end
        else
          flash[:alert] = @purchase.errors.messages
          render :new
        end
      end
    
      def purchase_params
        params.require(:purchase).permit(:name, :amount).merge(author_id: current_user.id)
      end
end
