require "input"

describe Input do

  before(:each) do
    @input = Input.new
    expect(File).to receive(:open).with('./input.txt','rb').and_return("5 3\n1 1 E\nRFRFRFRF\n\n3 2 N\nFRRFLLFFRRFLL")
  end

  it 'splits the input by line into an array of strings' do
    @input.parse_file
    expect(@input.parsed_input).to eq(["5 3", "1 1 E", "RFRFRFRF", "", "3 2 N", "FRRFLLFFRRFLL"])
  end

  it 'extracts, deletes and formats the grid dimensions from the array' do
    @input.format_grid_data
    expect(@input.formatted_grid_data).to eq([5,3])
    expect(@input.parsed_input).to eq(["1 1 E", "RFRFRFRF", "", "3 2 N", "FRRFLLFFRRFLL"])
  end

  it 'extracts the coordinates and the commands from the array' do
    @input.extract_robots_data
    expect(@input.robots_data).to eq([["1 1 E", "RFRFRFRF"], ["3 2 N", "FRRFLLFFRRFLL"]])
  end

  it 'format the robot data for consumption by a new robot' do
    @input.format_robot_data
    expect(@input.robot_pairs).to eq([[1,1,"E","RFRFRFRF"],[3, 2, "N","FRRFLLFFRRFLL"]])
  end

end