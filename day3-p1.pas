const
  mulRegex = 'mul\((\d+),(\d+)\)';

type
  Regex = System.Text.RegularExpressions.Regex;

begin
  var answer := 0;
  var input := ReadAllText('day3-in.txt');

  foreach var m in input.Matches(mulRegex) do
  begin
    var number1 := Integer.Parse(m.Groups[1].Value);
    var number2 := Integer.Parse(m.Groups[2].Value);
    answer += number1 * number2;
  end;

  answer.Println;
end.
