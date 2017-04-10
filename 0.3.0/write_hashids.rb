#!/usr/bin/env ruby

require 'hashids'

def hash_id_salt
  "Hanna"
end

def custom_alphabet
  alphabet = ('a'..'z').to_a | ('A'..'Z').to_a
  alphabet -= %w(l I)
  alphabet.join
end

hashids = Hashids.new(hash_id_salt, 6, custom_alphabet)

open('../output/old.json', 'w') { |f|
	for i in 1..1_000_000 do 
		hash = hashids.encrypt(i)
		f.puts hash
	end
}