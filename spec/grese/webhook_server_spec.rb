RSpec.describe Grese::WebhookServer do
  let(:server) do
    Grese::WebhookServer.new({
      url: 'https://sandbox.zendesk.com'
    }, true)
  end

  it 'should set debug to true' do
    expect(server.debug?).to be true
  end

  it 'should validate chef zendesk url' do
    result = server.valid_zendesk_request('https://getchef.zendesk.com')
    expect(result).to be true
  end

  it 'should not validate other urls' do
    result = server.valid_zendesk_request('https://google.com')
    expect(result).to_not be true
  end

  it 'should return an error for invalid url' do
    result = server.check_logs('https://google.com')
    expect(result[:error]).to eq 'Invalid URL'
  end

  it 'should validate gatherlog bundle' do
    result = server.valid_gatherlog_bundle('https://getchef.zendesk.com?name=foo.tar.gz')
    expect(result).to be true
  end

  it 'should validate as a gatherlog bundle' do
    result = server.valid_gatherlog_bundle('https://getchef.zendesk.com?name=foo.txt')
    expect(result).to_not be true
  end

  it 'should return an error for invalid url' do
    result = server.check_logs('https://google.com')
    expect(result[:error]).to eq 'Invalid URL'
  end
end
