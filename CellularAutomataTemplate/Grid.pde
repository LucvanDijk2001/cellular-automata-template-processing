class Grid
{
  //cell array
  Cell[][] cells;
  
  //a copy of the actual cell grid to read for changes in all cells without changing other cells first
  Cell[][] cellBuffer;

  //grid dimensions
  int gw, gh;


  Grid(int _w, int _h)
  {
    //set grid size
    gw = _w;
    gh = _h;

    //initialize all cells
    cells = new Cell[gw][gh];

    //calculate cells size
    float cellSizeX = width/gw, cellSizeY=height/gh;

    //create cells
    for (int i = 0; i < w; i++)
    {
      for (int j = 0; j < h; j++)
      {
        cells[i][j] = new Cell(i, j, cellSizeX, cellSizeY, this);
      }
    }
  }

  //update all cells every frame
  void Update()
  {
    for (int i = 0; i < w; i++)
    {
      for (int j = 0; j < h; j++)
      {
        cells[i][j].Update();
      }
    }
  }

  //iterate all cells
  void Iterate()
  {
    //make copy of cell array used by neighbouring functions
    cellBuffer = cells;
    
    for (int i = 0; i < w; i++)
    {
      for (int j = 0; j < h; j++)
      {
        cells[i][j].Iterate();
      }
    }
  }

  //show all cells
  void Show()
  {
    for (int i = 0; i < w; i++)
    {
      for (int j = 0; j < h; j++)
      {
        cells[i][j].Show();
      }
    }
  }
}
