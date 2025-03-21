resource "lab" "demo" {
  title = "Demo"
  description = "Showcase of the new lab format"

  layout "instruction_only" {
    default = true
    source = resource.layout.single_column

    instructions {
      panel = "instructions"
    }
  }

  layout "split_screen" {
    source = resource.layout.split_screen

    tab "code" {
      panel = "code"
      target = resource.editor.workstation
    }

    # tab "vscode" {
    #   panel = "code"
    #   target = resource.service.vscode
    # }

    tab "shell" {
      panel = "terminal"
      target = resource.terminal.workstation
    }

    instructions {
      panel = "instructions"
    }
  }

  layout "full_code" {
    source = resource.layout.single_column

    tab "lab" {
      active = true
      panel = "instructions"
      target = resource.editor.workstation
    }

    instructions {
      panel = "instructions"
    }
  }

  content {
    chapter "introduction" {
      layout = "instruction_only"
      source = resource.chapter.introduction
    }

    chapter "goals" {
      layout = "instruction_only"
      source = resource.chapter.goals
    }

    chapter "reimagined" {
      layout = "instruction_only"
      source = resource.chapter.reimagined
    }

    chapter "flow" {
      layout = "split_screen"
      source = resource.chapter.flow
    }

    chapter "behind_the_scenes" {
      layout = "full_code"
      source = resource.chapter.behind_the_scenes
    }
  }
}
