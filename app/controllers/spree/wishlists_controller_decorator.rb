#Spree::WishlistsController.class_eval do
#  before_filter :load_other_lists, :only => :show

#  private
#    def load_other_lists
#      @wishlist = Spree::Wishlist.find_by_access_hash(params[:id])

#      return unless current_user == @wishlist.user
#      @wishlists = current_user.wishlists.select {|wl| wl.id != @wishlist.id }
#    end
#end
