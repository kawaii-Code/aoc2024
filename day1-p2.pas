// Part 2
begin
  var a := new List<Integer>;
  var b := new Dictionary<Integer, Integer>;

  while True do begin
    try
      var (aa, bb) := ReadInteger2();
      a.Add(aa);
      if not b.ContainsKey(bb) then
        b[bb] := 0;
      b[bb] += 1;
    except
      on System.IO.IOException do
        break;
    end;
  end;

  var ans := 0;
  for var i := 0 to a.Count - 1 do begin
    if b.ContainsKey(a[i]) then
      ans += a[i] * b[a[i]];
  end;

  ans.Println;
end.

