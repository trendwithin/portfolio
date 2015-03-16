class ApplicationPolicy
  attr_reader :user, :article

  def initialize(user, article)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @article = article
  end

   def editor?
    @user.editor?
  end

  def author?
    @user.author?
  end

  def publish?
    @user.editor?
  end

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    @user.editor || @user.author
  end

  def new?
    create?
  end

  def update?
    @user.editor? || @user.author?
  end

  def edit?
    @user.editor? || @user.author?
  end

  def destroy?
    @user.editor?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    def resolve
      scope
    end
  end
end

