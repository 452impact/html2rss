RSpec.describe Html2rss::AttributePostProcessors::MarkdownToHtml do
  subject { described_class.new(markdown, config: config).get }

  let(:config) {
    Html2rss::Config.new(
      channel: { title: 'Example: questions', url: 'https://example.com/questions' }
    )
  }

  let(:markdown) {
    <<~MD
      # Section

      Price: 12.34

      - Item 1
      - Item 2

      `puts 'hello world'`
    MD
  }

  let(:html) {
    <<~HTML
      <h1>Section</h1>

      <p>Price: 12.34</p>

      <ul>
        <li>Item 1</li>
        <li>Item 2</li>
      </ul>

      <p><code>puts 'hello world'</code></p>
    HTML
      .squish
  }

  it { is_expected.to eq html }
end