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
    @user.editor?
    # @user && (user.editor?...)
    #@user.editor? || (record.author == @user && record.published == false)
  end

  def edit?
    (@user.editor? || @user.author?) && article.author == @user && article.publish? == false
  end

  def destroy?
    @user.editor?
    # || ((@user.id == record.author_id) && record.published)
  end

  def scope
    Pundit.policy_scope!(user, article.class)
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

