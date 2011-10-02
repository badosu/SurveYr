require 'spec_helper'

describe 'watch user' do
  before :each do
    @visitor = Factory :user
    @visited = Factory :user
    login_user @visitor
  end

  context 'given user doesnt watches visited' do
    before :each do
      @visitor.unfollow! @visited if @visitor.following? @visited
    end

    context 'when opening visited user page' do
      before :each do
        visit user_path @visited
      end

      it 'should have watch button' do
        page.should have_link 'Watch'
      end

      it 'should watch when clicked' do
        click_link 'Watch'
        page.should have_content 'Watching'
        visit user_path @visited
        page.should have_content 'Watching'
      end
    end
  end

  context 'given user watches visited' do
    before :each do
      @visitor.follow! @visited unless @visitor.following? @visited
    end

    context 'when opening visited user page' do
      before :each do
        visit user_path @visited
      end

      it 'should have unwatch button' do
        page.should have_link 'watching'
      end

      it 'should unwatch when clicked' do
        click_link 'Watching'
        page.should have_content 'Watch'
        visit user_path @visited
        page.should have_content 'Watch'
      end
    end
  end
end
