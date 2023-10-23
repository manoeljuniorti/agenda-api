class Contact < ApplicationRecord
  belongs_to :kind

  def as_json(options={})
    super(
      root: true,
      methods: [:kind_description, :author]
    )
  end

  def author
    'Manoel B.'
  end

  def kind_description
    self.kind.description
  end
end
