#include <stdio.h>
#include <omp.h>

int Partition(int array[], int low, int high)
{	
	int i,j,temp,pivot;
	if(low < high)
	{
		i = low;
		j = high;
		pivot = i;

		while(i < j)
		{
/*
if pivot is greater than element at left pointer then increament i (left pointer)
*/
			while(array[pivot] >= array[i] && i < high)  
			{
				i++;
			}
/*
if pivot is less than element at right pointer then decrement j (right pointer)
*/
			while(array[pivot] < array[j])
			{
				j--;
			}
/*
if left pointer is less than right pointer then swap elements pointed by left and right pointer ( i and j )
*/
			if(i < j)
			{
				temp = array[i];
				array[i] = array[j];
				array[j] = temp;
 			}

		}
/*
after every iteration of Partition Function pivot element is placed at it's correct position
*/
		temp = array[j];
		array[j] = array[pivot];
		array[pivot] = temp;
	
	}
	return(j);

}

void QuickSort(int array[], int low, int high)
{
	if(low < high)
	{
		int partitionNumber = Partition(array,low,high);
		printf("Partitioned At: %d\n",partitionNumber);
	
		#pragma omp parallel sections
		{
			#pragma omp section
			{
				QuickSort(array, low, partitionNumber-1);
			}
			#pragma omp section
			{
				QuickSort(array, partitionNumber+1, high);
			}
		}	
	}
}

int main()
{
	int array[10];
	int arraySize;
	int i;
	double startTime, totalTime;
	printf("Enter the Size of Array-\n");
	scanf("%d",&arraySize);
	
	printf("Enter Array Elements-\n");
	for(i = 0; i < arraySize; i++)
	{
		printf("Enter Element at position %d -",i);	
		scanf("%d",&array[i]);
	}

	printf("Entered Array is-\n");
	for(i = 0; i < arraySize; i++)
	{
		printf(" %d ",array[i]);		
	}
	printf("\n");

	startTime=omp_get_wtime(); 

	QuickSort(array, 0, arraySize-1);

	totalTime = omp_get_wtime() - startTime;
	
	printf("Sorted Array is-\n");
	for(i = 0; i < arraySize; i++)
	{
		printf(" %d ",array[i]);		
	}
	printf("\n");
	printf("Total Execution Time %f\n",totalTime);
}



