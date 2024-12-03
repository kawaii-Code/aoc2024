const
  dodontRegex = '(do\(\))|(don''t\(\))';
  mulRegex = 'mul\((\d+),(\d+)\)';

type
  Regex = System.Text.RegularExpressions.Regex;

function Next(input: String, from: Integer): Integer
begin
  var index1 := input.Find('do()', from);
  var index2 := input.Find('don''t()', from);
  if index1 = -1 then
    index1 := input.Length;
  if index2 = -1 then
    index2 := input.Length;
  Result := Min(index1, index2);
end;

begin
  var answer := 0;
  var input := ReadAllText('day3-in0.txt');

  var dRegex := new Regex(dodontRegex);

  var from := -1;
  var to_ := -1;
  while True do
  begin
    var match_from := Next(input, to_ + 1);
    if match_from = input.Length then
      break;
    var match_to := Next(input, match_from + 1);

    from := match_from;
    to_ := match_to;

    if match_from.Length > 4 then
      'hi'.Println;

    foreach var m in input.Substring(from, to_ - from).Matches(mulRegex) do
    begin
      var number1 := Integer.Parse(m.Groups[1].Value);
      var number2 := Integer.Parse(m.Groups[2].Value);
      answer += number1 * number2;
    end;
  end;
  
  answer.Println;
end.
