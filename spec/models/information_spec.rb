# require 'rails_helper'

# RSpec.describe Information, type: :model do
# before do
# @information = FactoryBot.build(:information)
# end

# context '内容に問題ない場合' do
# it 'カード情報とtokenがあれば保存ができること' do
# expect(@information).to be_valid
# end
# end

# context '内容に問題がある場合' do
# it 'カード情報が空では保存ができないこと' do
# @information.number - form = ''
# @information.valid?
# expect(@information.errors.full_messages).to include("Number-form can't be blank")
# end

# it 'tokenが空では登録できないこと' do
# @information.token = ''
# @information.valid?
# expect(@information.errors.full_messages).to include("Token can't be blank")
# end
# end
# end
