
Class0 =[];
for height = 3:15
    for width = 2:(height-1)
        Class0 = [Class0,[height,width]];
    end
end

Class1 = [];
for height = 2:14
    for width = (height+2):16
        Class1 = [Class1,[height,width]];
    end
end

Class2 = [];
for height = 2:14
    for width = 18:(32-height)
        Class2 = [Class2,[height,width]];
    end
end

Class3 =[];
for height = 4:15
    for width = 31:-1:(31-(height-4))
        Class3 = [Class3,[height,width]];
    end
end

Class4 = [];
for height = 17:29
	for width = 2:(14-(height-17))
		Class4 = [Class4,[height,width]];
	end
end

Class5 = [];
for height = 18:31
	for width = 16:-1:((16-(height-18)))
		Class5 = [Class5,[height,width]];
	end
end

Class6 = [];
for height = 18:31
	for width = 18:(18+(height-18))
		Class6 = [Class6,[height,width]];
	end
end

Class7 = [];
for height = 17:29
	for width = (20+(height-17)):31
		Class7 = [Class7,[height,width]];
	end
end



