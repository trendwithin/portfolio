class ApplicationPolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user || NullUser.new
    @article = article
  end

  def index?
    true
  end

  def show?

  end

  def create?
    @user.editor || @user.author
  end

  def new?
    create?
  end

  def update?
    @user.editor?
  end

  def edit?
    (@user.editor? || @user.author?) && article.author == @user && article.publish? == false
  end

  def destroy?
    @user.editor?
  end

  def scope
    Pundit.policy_scope!(user, article.class)
  end

  class NullUser
    def editor?
      false
    end

    def author?
      false
    end
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user || NullUser.new
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

