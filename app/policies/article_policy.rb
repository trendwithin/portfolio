class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.editor?
        scope.all
      else
      scope.where(:published => true)
    end
    end
  end
end
