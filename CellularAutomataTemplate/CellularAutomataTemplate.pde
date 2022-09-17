/*
Thank you for using this small quickly put together cellular automata template.
This template is bare bones and only includes the necessities to get started

Most functionality for this template should consist within the cell class itself.
This main file should not be touched often unless you add new cell functions

The grid class stores all the cells and iterates over all the cells, 
if you have a new cell function the grid should have a function to loop
over all cells to call the function, then this main file should call the grid
function in draw

cell class has some basic functionality. It has an active state
and 2 functions to get the active state of neighbour cells
NeighbourCountSide() gets active neighbours on L,R,U,D of the cell
NeighbourCountAll() gets active neighbours on L,R,U,D,TL,TR,BL,BR of the cell

Template includes a small example program in the cell class.
Switch out the current Iterate function for the one that's
commented out for some random generation

Enjoy
*/

int w=50, h=50;              //grid dimensions
float iterationSpeed = 0.3; //speed of iterations (int seconds)
float timer;                //countdown clock for iterations
Grid grid;                  //world

void setup()
{
  //set up the window
  size(600, 600);
  background(0);
  colorMode(HSB);

  //initialize timer
  timer = iterationSpeed;
  
  //initialize the grid(world)
  grid = new Grid(w, h);
}

void draw()
{
  //update
  //grid.Update(); //include if you want to update cells every frame for some reason, should not put any drawing stuff in here though

  //iterate grid
  timer -= 1.0f/frameRate;
  while(timer <= 0)
  {
    //clear background
    background(0);
    
    //iterate and reset timer
    grid.Iterate();
    timer += iterationSpeed;
  }

  //show grid
  grid.Show();
}
