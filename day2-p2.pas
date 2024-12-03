// Part2

function IsValidDifference(diff: Integer): Boolean;
begin
  Result := (1 <= Abs(diff)) and (Abs(diff) <= 3);
end;

begin
  var answer := 0;

  foreach var line in ReadLines('day2-in.txt') do
  begin
    var numbers := line.ToWords
                       .Select(x -> Integer.Parse(x))
                       .ToList;

    var isSafeAnywhere := False;

    for var ri := 0 to numbers.Length - 1 do
    begin
      var isSafe := True;
      var firstDifference := 1000000000;

      for var i := 1 to numbers.Length - 1 do
      begin
        if (ri = 0) and (i = 1) then
          continue;

        if (i = ri) then
          continue;

        var difference: Integer;
        if i - 1 = ri then
          difference := a[i] - a[i - 2];
        else
          difference := a[i] - a[i - 1];

        if not IsValidDifference(difference) then
        begin
          isSafe := false;
          break;
        end;

        if firstDifference = 1000000000 then
          firstDifference := difference;

        if Sign(firstDifference) <> Sign(difference) then
        begin
          isSafe := false;
          break;
        end;
      end;


    end;

    if isSafeAnywhere then
      answer += 1;
  end;

  answer.Println;
end.
