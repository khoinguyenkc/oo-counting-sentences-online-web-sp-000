require 'pry'

class String

  def sentence?
    #arraychar = self.split("")
    #arraychar.last == "." ? true : false
    self.buddy
    self.end_with?(".") ? true : false
  end

  def question?
    self.end_with?("?") ? true : false

  end

  def buddy
    puts "hello buddy"
  end

  def exclamation?
    self.end_with?("!") ? true : false
  end

  def clearmulti(string, piecetoremove)
    originalstring = string.dup
    lateststring = ""
    cuts = 0
    counter = 0
    loop do

      string.slice! piecetoremove
      #binding.pry
      if counter < 1 #aka first time only

        if string == originalstring #if no change
          return [string, 0]
        else
          cuts += 1
          lateststring = string.dup
          counter +=1
        end

      else #2nd time on

        if string == lateststring
          #binding.pry
          #no need to add cuts here, if string == lateststring, then the last slice was useless
          break
        else
          #binding.pry
          cuts += 1
          lateststring = string.dup #making a value copy
          #binding.pry
        end

      end
    end #end loop
    return [string, cuts]
  end


  def count_sentences
    #find all the !!, !!!, ..., .., ???, ??, counteach as one punctuation, remove it,
    #WARNING: ORDER MATTERS, first count the !!!, remove them, then count the !!, reverse order is messedup

     #gotta design a logic chain to tally up how many times u've removed things
     #about clearmulti: accepts string and piecetoremove, returns an array of [string, cuts]. final string and # of real cuts made
     tally = 0
     copyofstring = self.dup

     marks = ["???", "??", "?", "...", "..", ".", "!!!", "!!", "!"]
     #marks = ["???"]
     marks.each do | mark |
       #apparently self still refer to object, not array.
       result = self.clearmulti(copyofstring, mark)
       #binding.pry
       copyofstring = result[0]
       tally += result[1]
     end

     tally
  end



end

hi = "beyonce."
puts hi.sentence?

def clearmulti(string, piecetoremove)
  originalstring = string.dup
  lateststring = ""
  cuts = 0
  counter = 0
  loop do

    string.slice! piecetoremove
    #binding.pry
    if counter < 1 #aka first time only

      if string == originalstring #if no change
        return [string, 0]
      else
        cuts += 1
        lateststring = string.dup
        counter +=1
      end

    else #2nd time on

      if string == lateststring
        #binding.pry
        #no need to add cuts here, if string == lateststring, then the last slice was useless
        break
      else
        #binding.pry
        cuts += 1
        lateststring = string.dup #making a value copy
        #binding.pry
      end

    end
  end #end loop
  return [string, cuts]
end
puts "landmark"
#puts thisstuff = clearmulti("nothingtocuthere!sdfsdf?fsfsf???fadfd???dfs fdsfds???", "???")
#puts "how many cuts: #{thisstuff[1]}"
#it's counting but its MISCOUNTING by one extra. !!!!!!!

#problem: when theres nothing to cut, it still returns one. cuz the first time! it adds 1.
something = "whatever is good! is also bad!!! ???somewhere else... i think."
puts something.count_sentences


#puts otherstuff = clearmulti(thisstuff[0], "?")
