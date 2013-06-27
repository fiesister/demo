module("zf_md",package.seeall)

function ptSep( s,n ,k)
	s = s or '='
	n = n or 30
	str = ''
	for i=1,n do
		if i==math.floor(n/2) then
			str = str .. k
		else
			str = str .. s
		end
	end
	print (str)
end

function ptable( t ,key)
	ptSep('=',30,key .. ' Beg')
	for k,v in pairs(t) do
		print(k,v)
	end
	ptSep('=',30,key .. ' End')
end

function  p( obj , key)
	ptSep(nil,nil,key)
	print(obj)
	ptSep(nil,nil,key)
end

function printTable ( t, d ,maxdp,key)
	local depth = d or 0
	local maxdepth = maxdp or 100
	local indent = ""
	
	if depth==0 then
		ptSep(nil,nil, (key or '...' ) .. ' Beg')
	end

	for i = 1, depth do indent = indent .. "> " end
	for i, item in pairs ( t ) do

		io.write ( indent )
		print ( i, item )
		if type ( item ) == "table" and depth < maxdepth then
			printTable ( item, depth + 1 , maxdepth, key)
		end
	end

	if depth==0 then
		ptSep(nil,nil, (key or '...' ) .. ' End')
	end
end