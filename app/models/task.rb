class Task < ApplicationRecord
    belongs_to :user
    belongs_to :category 

    enum status: { pending: 'pending', in_progress: 'in_progress', completed: 'completed' }
end
