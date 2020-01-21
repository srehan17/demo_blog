# frozen_string_literal: true

class Comment < ApplicationRecord
  belong_to :post
end
