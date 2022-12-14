class Cell
{
  //surprisingly cells are still cells even if there is no "cell".
  //so rather i like to imagine there's always cells everywhere, 
  //they're just active or not, cells still have functionality even when not active
  boolean active = false;

  //parent grid
  Grid world;

  //grid position
  int x, y;

  //cell size
  float cw, ch;

  //initialize cell values
  Cell(int _x, int _y, float _w, float _h, Grid p)
  {
    world = p;
    x = _x;
    y = _y;
    cw = _w;
    ch = _h;

    //=================EXAMPLE=================//
    //50% chance to activate cell
    if (random(0, 100) > 50)
    {
      active = true;
    }
    //=================EXAMPLE=================//
  }

  //copy constructor cause java don't like copying things
  Cell(int _x, int _y, float _w, float _h, Grid p, boolean a)
  {
    world = p;
    x = _x;
    y = _y;
    cw = _w;
    ch = _h;
    active = a;
  }

  //copy function
  Cell copy()
  {
    return new Cell(x, y, cw, ch, world, active);
  }

  //frame update in case you would like to use this for some reason
  void Update()
  {
  }

  //gets called every iteration
  void Iterate()
  {
    active = !active;
    //GameOfLife(); //---------EXAMPLE
    //RandomGeneration(); //---EXAMPLE
  }

  //drawing the cell
  void Show()
  {
    if (active)
    {
      fill(255);
      rect(x*cw, y*ch, cw, ch);
    }
  }

  //only get the 4 direct neighbours
  int NeighbourCountSide()
  {
    //neighbour count variable
    int NBCount = 0;

    //check all neighbours
    //left
    if (x > 0) {
      if (world.cellBuffer[x-1][y].active) {
        NBCount++;
      }
    }

    //up
    if (y > 0) {
      if (world.cellBuffer[x][y-1].active) {
        NBCount++;
      }
    }

    //right
    if (x < world.gw-1) {
      if (world.cellBuffer[x+1][y].active) {
        NBCount++;
      }
    }

    //down
    if (y < world.gh-1) {
      if (world.cellBuffer[x][y+1].active) {
        NBCount++;
      }
    }

    return NBCount;
  }

  //get all neighbours including diagonal ones
  int NeighbourCountAll()
  {
    //neighbour count variable
    int NBCount = 0;

    //check all neighbours
    //left
    if (x > 0) {
      if (world.cellBuffer[x-1][y].active) {
        NBCount++;
      }
    }

    //up
    if (y > 0) {
      if (world.cellBuffer[x][y-1].active) {
        NBCount++;
      }
    }

    //right
    if (x < world.gw-1) {
      if (world.cellBuffer[x+1][y].active) {
        NBCount++;
      }
    }

    //down
    if (y < world.gh-1) {
      if (world.cellBuffer[x][y+1].active) {
        NBCount++;
      }
    }

    //top left
    if (x > 0 && y > 0) {
      if (world.cellBuffer[x-1][y-1].active) {
        NBCount++;
      }
    }

    //top right
    if ( x < world.gw-1 && y > 0) {
      if (world.cellBuffer[x+1][y-1].active) {
        NBCount++;
      }
    }

    //bottom left
    if (x > 0 && y < world.gh-1) {
      if (world.cellBuffer[x-1][y+1].active) {
        NBCount++;
      }
    }

    //bottom right
    if ( x < world.gw-1 && y < world.gh-1) {
      if (world.cellBuffer[x+1][y+1].active) {
        NBCount++;
      }
    }

    return NBCount;
  }

  //===================GAME OF LIFE EXAMPLE====================//
  void GameOfLife()
  {
    int neighbours = NeighbourCountAll();

    if (!active)
    {
      if (neighbours == 3) {
        active = true;
      }
    } else
    {
      if (neighbours < 2 || neighbours > 3) {
        active = false;
      }
    }
  }
  //===================GAME OF LIFE EXAMPLE====================//

  //=================RANDOM GENERATION EXAMPLE=================//
  void RandomGeneration()
  {
    int neighbours = NeighbourCountSide(); //get neighbour count for only 4 main sides (no diagonals)

    //ruleset
    if (neighbours >= 3)
    {
      active = true;
    }

    if (neighbours <= 1)
    {
      active = false;
    }
  }
  //=================RANDOM GENERATION EXAMPLE=================//
}
