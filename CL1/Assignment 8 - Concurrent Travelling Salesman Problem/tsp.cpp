#include<iostream>
using namespace std;

class tsp
{
	public :
		int cost[10][10];
		int isVisited[10];
		int adjecent[10];
		int numCities;
		int path[10];
		int globalIndex;
		int  tempCost, totalCost;
		tsp()
		{
			globalIndex = 0;
			GetInput();
			totalCost =0;
			for(int i = 0; i<10; i++)
			{
				isVisited[i] = 0;
				adjecent[i] = 0;
			}	


		}

	void GetInput()
	{
		cout<<"Enter Number of Cities -"<<endl;
		cin>>numCities;

		for(int i = 0; i < numCities; i++)
		{
			for(int j = 0; j < numCities; j++)
			{
				if(i==j)
				{
					cost[i][j] == 999;
				}
				else
				{
					cout<<"Enter distance between "<<i<<" and "<<j<<" "<<endl;
					cin>>cost[i][j];
				}			
			}
		}
	}

	void PathFinder(int vertex)
	{

			isVisited[vertex] = 1;
			int prevMinCity;

			for(int i=0;i<numCities;i++)
			{
				if(i == 0 && isVisited[i] != 1)
				{
					tempCost = cost[vertex][i];
					prevMinCity = i;
				}
				else
				{
					if(tempCost>cost[vertex][i] && isVisited[i] != 1)
					{
						tempCost = cost[vertex][i];
						isVisited[prevMinCity] = 0;
						isVisited[i] = 1;
						totalCost += tempCost;
						globalIndex ++;
						path[globalIndex] = i;
						prevMinCity = i;
						
						if(globalIndex < numCities)
							PathFinder(path[i]);
						else
							return ;
					}					
				}
			}
									
	}
	void PrintSolution()
	{
		cout<<"Shortest Path Cost - "<<totalCost<<endl;
		cout<<"Path is"<<endl;
		for(int i=0;i<numCities;i++)
		{
			cout<<"\t"<<path[i];
		}
		cout<<endl;
	}


};



int main()
{
	tsp object;
	object.PathFinder(0);
	object.PrintSolution();

return 0;
}
