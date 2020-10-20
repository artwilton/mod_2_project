class Transaction < ApplicationRecord
    enum status: { pending: 0, failed: 1, paid: 2, paypal_executed: 3}
    enum payment_gateway: { stripe: 0, paypal: 1 }

    scope :recently_created, ->  { where(created_at: 1.minutes.ago..DateTime.now) }

    belongs_to :expert, class_name: "User", foreign_key: :expert_id
    belongs_to :student, class_name: "User", foreign_key: :student_id

    def set_paid
        self.status = Transaction.statuses[:paid]
    end
    def set_failed
        self.status = Transaction.statuses[:failed]
    end
    def set_paypal_executed
        self.status = Transaction.statuses[:paypal_executed]
    end
end