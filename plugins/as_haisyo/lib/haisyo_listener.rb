class HaisyoListener < AsakusaSatellite::Hook::Listener
  def message_buttons(context)
    message = truncate(context[:message].body.gsub(/\r\n|\r|\n|\t/," "))

js_code = <<JSCODE
$(function() {
  $('#message').val('拝承。 ＞ #{message}');
  $('.inputarea').submit();
});
JSCODE

    return <<HTML
<img src="/plugin/as_haisyo/image/haisyo.png" onClick="#{js_code}" alt="拝承。">
HTML
  end
end

