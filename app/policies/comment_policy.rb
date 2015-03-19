class CommentPolicy < ArticlePolicy


  class Scope < Scope
    def resolve
      if user.editor?
        scope.all
      else
        scope.where(approved: true)
      end
    end
  end
end
