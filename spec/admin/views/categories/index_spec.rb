require 'spec_helper'

describe Admin::Views::Categories::Index do
  let(:shoes)     { CategoryRepository.create(Category.new(name: "shoes", description: "description for shoes")) }
  let(:tshirts)   { CategoryRepository.create(Category.new(name: "tshirts", description: "description for tshirts")) }
  let(:exposures) { Hash[params: [categories: [shoes, tshirts]]] }
  let(:template)  { Lotus::View::Template.new('apps/admin/templates/categories/index.html.erb') }
  let(:view)      { Admin::Views::Categories::Index.new(template, exposures) }

  describe '#new_category_link' do
    it 'shows a link to create a new category' do
      expect(view.new_category_link).to eq("<a href=\"/categories/new\">New Category</a>")
    end
  end

  describe '#edit_link' do
    it 'shows a link to edita category' do
      expect(view.edit_link(10)).to eq("<a href=\"/categories/10/edit\">Edit Category</a>")
    end
  end

  describe '#delete_form' do
    it 'shows a form to delete a category' do
      expect(view).to receive(:form_for).with(:category, view.routes.category_path(10), method: :delete)
      view.delete_form(10)
    end
  end
end