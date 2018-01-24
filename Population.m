classdef Population < handle

	properties

		mat

		lBound
		uBound

		M
		N
		best

		fitness
		violation

	end


	methods

		function obj = Population(mat_, N_, lBound_, uBound_)

			if nargin < 3
				uBound_ = 1e19;
				lBound_ = -1e19;
			end

			if nargin < 2
				N_ = 0;
			end

			if nargin == 0
				mat_ = 0;
			end


			obj.N = N_;

			obj.lBound = lBound_;
			obj.uBound = uBound_;

			obj.best = [];

			if length(mat_) == 1
				obj.mat = zeros(mat_, obj.N);
			else
				obj.mat = mat_;
			end

			obj.M = size(obj.mat, 1);

			obj.fitness = zeros(obj.M, 1);
			obj.violation = zeros(obj.M, 1);
		end


        function push_back(obj, x, func, pos)
		
        	if nargin < 4
        		pos = size(obj.mat, 1) + 1;
        	end

			if size(x, 1) > size(x, 2)
				x = x';
			end

			[ff vv] = func.eval(x);

			obj.mat(pos, :) = x;
			obj.fitness(pos) = ff;
			obj.violation(pos) = vv;

			M = size(obj.mat, 1);
    	end

	end
end