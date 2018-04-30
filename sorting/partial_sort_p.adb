package body Partial_Sort_P with
     Spark_Mode is

   procedure Partial_Sort (H : in out Heap; M : Positive) is
      Old_V    : T;
      Old_Size : constant Natural := H.Size;
      Size     : constant Natural := M - 1;
      A_Save   : T_Arr            := H.A with
         Ghost;
   begin
      if M > 1 then
         H.Size := Size;
         for J in M .. Old_Size loop
            if H.A (J) < H.A (1) then
               Pop_Heap (H);
               Swap_Array (H.A, M - 1, J);
               H.Size := Size;

               pragma Assert
                 (for all K in 1 .. Size =>
                    Lower_Bound (H.A (M .. J), H.A (K)));
               A_Save := H.A;
               pragma Assert
                 (for all K in 1 .. Size =>
                    Lower_Bound (A_Save (M .. J), H.A (K)));
               Push_Heap (H);
               pragma Assert( Occ(H.A, H.A(1)) >= 1);
               pragma Assert
                 (for all K in 1 .. Size =>
                    Lower_Bound (A_Save (M .. J), A_Save (K)));
               pragma Assert (Multiset_Unchanged (A_Save, H.A));
               pragma Assert (A_Save (M .. J) = H.A (M .. J));
               pragma Assert (Lower_Bound (H.A (M .. J), H.A (1)));

            end if;
            Upper_Bound_Heap (H, H.A (1));
            pragma Loop_Invariant (H.Size = Size);
            pragma Loop_Invariant (Is_Heap_Def (H));
            pragma Loop_Invariant (Upper_Bound (H.A (1 .. M - 1), H.A (1)));
            pragma Loop_Invariant (Lower_Bound (H.A (M .. J), H.A (1)));
            pragma Loop_Invariant (Multiset_Unchanged (H.A, H'Loop_Entry.A));
            pragma Loop_Invariant
              (if
                 J < MAX_SIZE
               then
                 H.A (J + 1 .. MAX_SIZE) = H'Loop_Entry.A (J + 1 .. MAX_SIZE));
         end loop;
         A_Save := H.A;
         Prove_Partition(H.A(1 .. Old_Size),M);
         Sort_Heap (H);

         H.Size := Old_Size;

      --   Prove_Partition (H.A (1 .. Old_Size), M);
      end if;
   end Partial_Sort;

end Partial_Sort_P;
