PROJECT      = mutating_algorithms.gpr
CHAPTER_NAME = mutating

# timeout for chapter
MUTATING_DEFAULT_TIMEOUT = "TIMEOUT=5"

# all proof targets
ALL_PROOF_TARGET = copy fill random_shuffle remove_copy replace_copy replace reverse_copy \
		reverse_in_place rotate_copy rotate swap swap_ranges

# specification dependencies for each function
SPEC_TYPES       		= ../spec/types.ads
SPEC_LEMMAS 			= ../lemmas/classic_lemmas.ads
SPEC_FILL 			= $(SPEC_TYPES) ../spec/has_constant_subrange_p.ads
SPEC_SWAP 			= $(SPEC_TYPES)
SPEC_SWAP_RANGES  		= $(SPEC_TYPES) $(call GENERATE_DEP,swap)
SPEC_SWAP_RANGES_INDEX  	= $(SPEC_TYPES) $(call GENERATE_DEP,swap)
SPEC_COPY 			= $(SPEC_TYPES) ../spec/equal_ranges_p.ads
SPEC_REVERSE_COPY 		= $(SPEC_TYPES) ../spec/is_reversed_p.ads
SPEC_REVERSE_IN_PLACE 		= $(SPEC_REVERSE_COPY)
SPEC_REVERSE_IN_PLACE_SWAP 	= $(SPEC_REVERSE_COPY) $(call GENERATE_DEP, swap)
SPEC_ROTATE_COPY 		= $(SPEC_TYPES) $(call GENERATE_DEP, copy)
SPEC_ROTATE 			= $(SPEC_TYPES) $(call GENERATE_DEP, reverse_in_place)
SPEC_REPLACE_COPY 		= $(SPEC_TYPES) ../spec/is_replaced_p.ads
SPEC_REPLACE 			= $(SPEC_REPLACE_COPY)
SPEC_REMOVE_COPY 		= $(SPEC_TYPES) ../spec/multiset_predicates.ads ../spec/occ_p.ads ../spec/occ_def_p.ads ../lemmas/remove_copy_lemmas.ads
SPEC_REMOVE_COPY_FIRST 		= $(SPEC_TYPES) ../spec/multiset_predicates.ads ../spec/occ_p.ads ../spec/occ_def_p.ads
SPEC_REMOVE_COPY_SECOND 	= $(SPEC_TYPES) ../spec/multiset_predicates.ads ../spec/occ_p.ads ../spec/occ_def_p.ads ../lemmas/remove_copy_lemmas.ads
SPEC_RANDOM_SHUFFLE 		= $(SPEC_TYPES) $(SPEC_LEAMMAS) ../spec/multiset_predicates.ads $(call GENERATE_DEP, random) $(call GENERATE_DEP, swap_array)

# proof level for each function
LEVEL_FILL                   = 0
LEVEL_SWAP                   = 0
LEVEL_SWAP_RANGES            = 1
LEVEL_SWAP_RANGES_INDEX      = 1
LEVEL_COPY                   = 0
LEVEL_REVERSE_COPY           = 0
LEVEL_REVERSE_IN_PLACE       = 1
LEVEL_REVERSE_IN_PLACE_SWAP  = 4
LEVEL_ROTATE_COPY            = 1
LEVEL_ROTATE                 = 1
LEVEL_REPLACE_COPY           = 1
LEVEL_REPLACE                = 1
LEVEL_REMOVE_COPY            = 1
LEVEL_REMOVE_COPY_FIRST      = 4
LEVEL_REMOVE_COPY_SECOND     = 4
LEVEL_RANDOM_SHUFFLE         = 1

include ../Makefile-common

.PHONY: $(ALL_PROOF_TARGETS)

# Fill
fill: $(call GENERATE_DEP, fill) $(SPEC_FILL)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_FILL) $(MUTATING_DEFAULT_TIMEOUT)

# Swap
swap: $(call GENERATE_DEP,swap) $(SPEC_SWAP)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_SWAP) $(MUTATING_DEFAULT_TIMEOUT)

# Swap_Ranges
swap_ranges: $(call GENERATE_DEP,swap_ranges) $(SPEC_SWAP_RANGES)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_SWAP_RANGES) $(MUTATING_DEFAULT_TIMEOUT)

# Swap_Ranges_Index
swap_ranges_index: $(call GENERATE_DEP,swap_ranges_index) $(SPEC_SWAP_RANGES_INDEX)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_SWAP_RANGES_INDEX) $(MUTATING_DEFAULT_TIMEOUT)

# Copy
copy: $(call GENERATE_DEP, copy) $(SPEC_COPY)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_COPY) $(MUTATING_DEFAULT_TIMEOUT)

# Reverse_Copy
reverse_copy: $(call GENERATE_DEP, reverse_copy) $(SPEC_REVERSE_COPY)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_REVERSE_COPY) $(MUTATING_DEFAULT_TIMEOUT)

# Reverse_In_Place
reverse_in_place: $(call GENERATE_DEP, reverse_in_place) $(SPEC_REVERSE_IN_PLACE)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_REVERSE_IN_PLACE) $(MUTATING_DEFAULT_TIMEOUT)

# Reverse_In_Place_Swap
reverse_in_place_swap: $(call GENERATE_DEP, reverse_in_place_swap) $(SPEC_REVERSE_IN_PLACE_SWAP)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_REVERSE_IN_PLACE_SWAP) $(MUTATING_DEFAULT_TIMEOUT)

# Rotate_Copy
rotate_copy: $(call GENERATE_DEP, rotate_copy) $(SPEC_ROTATE_COPY)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_ROTATE_COPY) $(MUTATING_DEFAULT_TIMEOUT)

# Rotate
rotate: $(call GENERATE_DEP,rotate) $(SPEC_ROTATE)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_ROTATE) $(MUTATING_DEFAULT_TIMEOUT)

# Replace_Copy
replace_copy: $(call GENERATE_DEP, replace_copy) $(SPEC_REPLACE_COPY)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_REPLACE_COPY) $(MUTATING_DEFAULT_TIMEOUT)

# Replace
replace: $(call GENERATE_DEP, replace) $(SPEC_REPLACE)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_REPLACE) $(MUTATING_DEFAULT_TIMEOUT)

# Remove_Copy
remove_copy: $(call GENERATE_DEP, remove_copy) $(SPEC_REMOVE_COPY)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_REMOVE_COPY) $(MUTATING_DEFAULT_TIMEOUT)

# Remove_Copy_First
remove_copy_first: $(call GENERATE_DEP, remove_copy_first) $(SPEC_REMOVE_COPY_FIRST)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_REMOVE_COPY_FIRST) $(MUTATING_DEFAULT_TIMEOUT)

# Remove_Copy_Second
remove_copy_second: $(call GENERATE_DEP, remove_copy_second) $(SPEC_REMOVE_COPY_SECOND)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_REMOVE_COPY_SECOND) $(MUTATING_DEFAULT_TIMEOUT)

# Random_Shuffle
random_shuffle: $(call GENERATE_DEP, random_shuffle) $(SPEC_RANDOM_SHUFFLE)
	make prove FILE=$@_p.adb LEVEL=$(LEVEL_RANDOM_SHUFFLE) $(MUTATING_DEFAULT_TIMEOUT)

# all proofs
all :$(ALL_PROOF_TARGET)
	$(_STATS_CHAPTER)
