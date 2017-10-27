#include<iostream>
#include<stdlib.h>
#include<math.h>
#include<vector>
using namespace std;

int min(int sub_result[],int k)
{
	int min=100;
	for(int i=0;i<k;i++)
	{
		if(sub_result[i]<min)
		{
			min=sub_result[i];
		}
	}
	return min;
}

int indexof(int min,int sub_result[],int k)
{
	int index;
	for(int i=0;i<k;i++)
	{
		if(min==sub_result[i])
		{
			index=i;
			break;
		}
	}
	return index;
}

int mean(vector<int> vc)
{
	int sum=0;
	for(int i=0;i<vc.size();i++)		//cant recollect vc.size
	{
		sum=sum+vc[i];
	}
	return (sum/vc.size());
}

bool isEqual(int arr1[],int arr2[],int k)
{
	for(int i=0;i<k;i++)
	{
		if(arr1[i]!=arr2[i])
		{
			return false;
		}
	}
	return true;
}

void show(vector<int> vc)
{
	for(int i=0;i<vc.size();i++)
	{
		cout<<"\t"<<vc[i];
	}
}

int main()
{
	int n,k;
	cout<<"\nEnter the number of objects:";
	cin>>n;
	
	cout<<"Enter the number of clusters:";
	cin>>k;

	int obj[n];
	int clusterMean[k];
	int oldClusterMean[k];
	int sub_result[k];
	vector< vector<int> > groups;

	for(int i=0;i<n;i++)
	{
		cout<<"\nEnter object ("<<i+1<<"):";
		cin>>obj[i];

		if(i<k)
		{
			clusterMean[i]=obj[i];
		}
	}

	for(int i=0;i<k;i++)
	{
		vector<int> newgroups;
		groups.push_back(newgroups);
	}

	do
	{
		for(int i=0;i<n;i++)
		{
			for(int j=0;j<k;j++)
			{
				sub_result[j]=abs(clusterMean[j]-obj[i]);
			}
			groups[indexof(min(sub_result,k),sub_result,k)].push_back(obj[i]);
		}

		for(int j=0;j<k;j++)						//flow 2for->for if->if for  calc->copying (!empty)->if !equal clear
		{
			if(!groups[j].empty())
			{
				oldClusterMean[j]=clusterMean[j];
				clusterMean[j]=mean(groups[j]);
			}
		}

		if(!isEqual(oldClusterMean,clusterMean,k))
		{
			for(int j=0;j<k;j++)
			{
				groups[j].clear();
			}
		}

	}while(!isEqual(oldClusterMean,clusterMean,k));

	cout<<"\nClsuters are:\n";
	for(int j=0;j<k;j++)
	{
		cout<<"\nC"<<j+1<<":"<<clusterMean[j];
		
	}

	cout<<"\n\n";

	for(int j=0;j<k;j++)
	{
		cout<<"\nGroups "<<j+1<<":";
		show(groups[j]);		//take show groups[j] seperate
	}

	
}

/*
ajinkya@ubuntu:~/CL-1/kmeans$ g++ kmeans.cpp
ajinkya@ubuntu:~/CL-1/kmeans$ ./a.out

Enter the number of objects:9
Enter the number of clusters:2

Enter object (1):2

Enter object (2):4

Enter object (3):10

Enter object (4):12

Enter object (5):3

Enter object (6):20

Enter object (7):30

Enter object (8):11

Enter object (9):25

Clsuters are:

C1:7
C2:25


Groups 1:	2	4	10	12	3	11
Groups 2:	20	30	25ajinkya@ubuntu:~/CL-1/kmeans$ 
*/
