class Task < ApplicationRecord
    belongs_to :user
    belongs_to :category , optional: true

    enum status: { pending: 'pending', in_progress: 'in_progress', completed: 'completed' }
    enum priority: { urgent: 'urgent', high: 'high', medium: 'medium', low: 'low' }
end
