class Bug < ApplicationRecord
  belongs_to :project
	enum status:[:New,:Started,:Completed]
end
