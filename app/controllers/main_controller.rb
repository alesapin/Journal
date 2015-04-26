class MainController < ApplicationController
	skip_before_action :authorize, [:index]
	def self.get_top_misses
		@top_misses = Hash.new;
		Student.all.each do |student|
			@top_misses["#{student.name + " " + student.surname}"] = 0
			student.misses.each do |miss|
				pair=Pair.find(miss.pair_id)
				if pair.today > Date.today - 7
					if miss.hours != nil
						@top_misses["#{student.name + " " + student.surname}"] += miss.hours
					end
				end
			end
		end
		@top=@top_misses.sort_by {|k, v| -v}.first 5 
	end
	def self.top_missed_subject
		@top_subj= Hash.new
		Subject.all.each do |subject|
			@top_subj["#{subject.title}"] = [0,0]
			subject.pairs.where("today > #{Date.today - 30}").each do |pair|
				pair.misses.each do |miss|
					if miss.hours != nil
						@top_subj["#{subject.title}"][0] += miss.hours
					end
				end
			end
		end
		@top_subj=@top_subj.sort_by{ |k, v| -v[0]}.first 7
	end

	def self.get_pairs_today
		@number=0
		Pair.all.each do |pair|
			if (pair.today > Date.today - 7)
				@number+=1
			end
		end
		return @number
	end

	def self.middle_pairs
		@result=Hash.new
		Pair.all.each do |pair|
			@result[pair.today]=1;
		end
		Pair.all.count/@result.length.to_f
	end
	def self.max_pairs
		@max=0
		Teacher.all.each do |teacher|
			tmp = teacher.pairs.count
			if(tmp > @max)
				@max = tmp 
			end
		end
		return @max
	end
end