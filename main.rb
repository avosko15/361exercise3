class MentalState
	def auditable?
		# true if the external service is online, otherwise false
	end

	def audit!
		# Could fail if external service is offline
		raise OfflineException.new('External service is offline') unless auditable?
	end

	def do_work
		# Amazing stuff...
	end
end

def audit_sanity(bedtime_mental_state)
	if bedtime_mental_state.audit!.ok?
		MorningMentalState.new(:ok)
	else 
		MorningMentalState.new(:not_ok)
	end
end

begin 
	new_state = audit_sanity(bedtime_mental_state)
rescue OfflineException => e
	e.message()
end



# Exercise 5 Part 2 (Don't Return Null / Null Object Pattern)

class BedtimeMentalState < MentalState ; end

class MorningMentalState < MentalState ; end

def audit_sanity(bedtime_mental_state)
	if bedtime_mental_state.audit!.ok?
		MorningMentalState.new(:ok)
	else
		MorningMentalState.new(:not_ok)
	end
end

if bedtime_mental_state.auditable?
	new_state = audit_sanity(bedtime_mental_state)
	new_state.do_work
  

# Exercise 5 Part 3 (Wrapping APIs)

require 'candy_service'

class Machine
	@machine = CandyMachine.new

	def prepare
		machine.prepare
	end

	def ready?
		machine.ready?
	end

	def make!
		machine.make!
	end
end

machine = Machine.new
machine.prepare
if machine.ready?
	machine.make!
else
	puts "sadness"
end