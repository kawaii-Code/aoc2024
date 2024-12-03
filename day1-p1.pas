// Part 1
begin
  var a := new List<Integer>;
  var b := new List<Integer>;

  while True do begin
    try
      var (aa, bb) := ReadInteger2();
      a.Add(aa);
      b.Add(bb);
    except
      on System.IO.IOException do
        break;
    end;
  end;

  a.Sort;
  b.Sort;

  var ans := 0;
  for var i := 0 to a.Count - 1 do begin
    ans += Abs(a[i] - b[i]);
  end;

  ans.Println;
end.

