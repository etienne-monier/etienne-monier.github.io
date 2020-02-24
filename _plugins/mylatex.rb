module Jekyll
  class MyLaTeXTagBlock < Liquid::Block

    def render(context)
      text = super
      "<div class='math message' style='text-align: center;' markdown='1'> \\displaystyle#{text} </div>"
    end

  end
end

Liquid::Template.register_tag('katex', Jekyll::MyLaTeXTagBlock)

# class='math'