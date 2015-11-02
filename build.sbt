shellPrompt := { state =>
  Project.extract(state).currentProject.id +
    "git branch".lines_!.find{_.head == '*'}.map{_.drop(1)}.getOrElse("") + "> "
}