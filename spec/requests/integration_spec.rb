require 'rails_helper'

RSpec.describe 'Basic operations', :type => :request do
  it 'adds category and product' do
    get '/categories'
    expect(response).to have_http_status(200)
    expect(response).to render_template('categories/index')
    expect(assigns(:categories).count).to eq(0)

    get '/categories/new'
    expect(response).to have_http_status(200)

    post '/categories', :category => {:name => 'Fruits'}
    category = assigns(:category)
    expect(response).to redirect_to(category)
    follow_redirect!
    expect(response).to render_template('categories/show')

    get '/categories'
    expect(response).to have_http_status(200)
    expect(response).to render_template('categories/index')
    expect(assigns(:categories).count).to eq(1)

    get '/products'
    expect(response).to have_http_status(200)
    expect(response).to render_template('products/index')
    expect(assigns(:products).count).to eq(0)

    get '/products/new'
    expect(response).to have_http_status(200)

    post '/products', :product => {:name => 'Apple', :price => 1, :category_id => category.id}
    expect(response).to redirect_to(assigns(:product))
    follow_redirect!
    expect(response).to render_template('products/show')

    get '/products'
    expect(response).to have_http_status(200)
    expect(response).to render_template('products/index')
    expect(assigns(:products).count).to eq(1)
  end
end
