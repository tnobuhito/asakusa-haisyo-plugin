require File.dirname(__FILE__) + '/../../../../spec/spec_helper'
require 'haisyo_listener'

describe HaisyoListener do
  before do
    @room = Room.new(title: 'test room').tap{|x| x.save! }
    @user = User.new(name: 'test user', screen_name: 'test').tap{|x| x.save! }
    @message = Message.create(body: "引用元メッセージ", user: @user, room: @room)
    @listener = HaisyoListener.new({})
  end

  describe "message_buttons" do
    it "onClickにJavaScriptコードを指定したボタン要素を作成する" do
      context = { message: @message }
      expected = <<EOS
<input type="button" onClick="$(function() {
  $('#message').val('拝承。 ＞ 引用元メッセージ');
  $('.inputarea').submit();
});
">
EOS
      expect(@listener.message_buttons(context)).to eq(expected)
    end
  end
end
