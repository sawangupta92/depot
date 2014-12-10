class ProductSweeper < ActionController::Caching::Sweeping::Sweeper
  observe Product
  def after_save(product)
    expire_cache(product)
  end
  def expire_cache(product)
    expire_page controller: :products, action: :show
  end
end