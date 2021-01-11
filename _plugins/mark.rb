module Jekyll
  class MarkTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @mark = Float(text)
    end

    def render(context)
      $i = 1
      $num = 5
      $s = ''

      # Stars
      # $full = '<i class="fas fa-star"></i> '
      # $half = '<i class="fas fa-star-half-alt"></i> '
      # $empty = '<i class="far fa-star"></i> '

      # Circles
      $full = '<i class="fi-mark-full"></i> '
      $half = '<i class="fi-mark-half"></i> '
      $empty = '<i class="fi-mark-empty"></i> '

      # Loop for the 5 mark.
      while $i <= $num  do

        # Full element.
        if $i <= @mark.floor
          $s << $full
        
        # Half element.
        elsif $i > @mark.floor and $i < @mark + 1
          $s << $half
        
        # Empty element
        else
          $s << $empty
        end
        $i +=1
      end
      
      # Output the string
      $s
    end
  end
end

Liquid::Template.register_tag('mark', Jekyll::MarkTag)
