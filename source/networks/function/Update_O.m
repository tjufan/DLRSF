function O = Update_O(Us)
    U = dotSeries(Us);
    O = calInvVar(U);
end