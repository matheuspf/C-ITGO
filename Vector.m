classdef Vector < handle

	properties
		v
		fitness
		violation
	end

	methods

		function obj = Vector(val, fitn, viol)

			if nargin < 3
				viol = 1e19;
			end

			if nargin < 2
				fitn = 1e19;
			end

			if nargin < 1
				val = 0;
			end


			if length(val) > 1
				obj.v = val;

				if size(obj.v, 2) ~= 1
					obj.v = obj.v';
				end
			else
				obj.v = zeros(val, 1);
			end

			obj.fitness = fitn;
			obj.violation = viol;
		end


        function r = minus(a, b)
        	a.v = a.v - b.v;
        	r = a;
        end
        

		function r = length(obj)
			r = length(obj.v);
		end


		function r = isFeasible(obj)
			r = obj.violation == 0.0;
		end


		function r = lt(a, b)
			if a.isFeasible() && b.isFeasible()
				r = a.fitness < b.fitness;
			elseif a.isFeasible()
				r = true;
			elseif b.isFeasible()
				r = false;
			else
				r = a.violation < b.violation;
			end
		end


		function r = min(a, b)
			if a < b
				r = a;
			else
				r = b;
			end
		end

		function r = max(a, b)
			if a < b
				r = b;
			else
				r = a;
			end
		end


		function sref = subsref(obj,s)
		   switch s(1).type
		      case '.'
		         sref = builtin('subsref', obj, s);
		      case '()'
		         if length(s) < 2
		            sref = builtin('subsref', obj.v, s);
		         else
		            sref = builtin('subsref', obj, s);
		         end
		   end
		end


		function sref = subsasgn(obj, s, b)
		   switch s(1).type
		      case '.'
		         sref = builtin('subsasgn', obj, s, b);
		      case '()'
		         obj.v = builtin('subsasgn', obj.v, s, b);
		         sref = obj;
		   end
		end

	end
end