# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ActiverecordAccessibleJson::JsonExtension, type: :model do
  shared_examples 'accessible JSON attributes' do
    specify { expect(post.tags).to be_an_instance_of Array }
    specify { expect(post.author).to be_an_instance_of ActiveSupport::HashWithIndifferentAccess }
    specify { expect(post.author[:name]).to eq post.author['name'] }
    specify { expect(post.author[:age]).to eq post.author['age'] }
  end

  shared_examples 'serializable record' do
    before do
      post.save!
      post.reload
    end

    specify 'correct value is saved' do
      expect(post.author[:name]).to eq name
      expect(post.author[:age]).to eq age
      expect(post.tags).to contain_exactly *tags
    end
  end

  let(:name) { 'yamat47' }
  let(:age) { 27 }
  let(:tags) { %w(Rails TDD) }

  context 'when record is loaded from database' do
    before do
      Post.create!(author: { name: name, age: age }, tags: tags)
    end

    let(:post) { Post.first }

    it_behaves_like 'accessible JSON attributes'
  end

  context 'when record is initialized by ApplicationRecord.new with symbol keys' do
    let(:post) { Post.new(author: { name: name, age: age }, tags: tags) }

    it_behaves_like 'accessible JSON attributes'
    it_behaves_like 'serializable record'
  end

  context 'when record is initialized by ApplicationRecord.new with string keys' do
    let(:post) { Post.new(author: { 'name': name, 'age': age }, tags: tags) }

    it_behaves_like 'accessible JSON attributes'
    it_behaves_like 'serializable record'
  end
end
