def heapArray(array)
	init_index = (array.size / 2) - 1
	while init_index >= 0
		adjustHeap!(array, array.size, init_index)
		init_index = init_index - 1
	end
end
