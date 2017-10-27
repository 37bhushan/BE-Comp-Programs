#include<iostream>
#include<algorithm>
#include<math.h>
using namespace std;

struct point
{
	int val;
	double x,y;
	double distance;
};

bool comparison(point a,point b)
{
	return (a.distance<b.distance);
}

int classifyapoint(point arr[],int n,int k,point p)		//didnt dec arr as arr[]
{
	for(int i=0;i<n;i++)
	{
		arr[i].distance=sqrt((arr[i].x-p.x)*(arr[i].x-p.x)+(arr[i].y-p.y)*(arr[i].y-p.y));
	}

	sort(arr,arr+n,comparison);


	int freq1=0;
	int freq2=0;

	for(int i=0;i<k;i++)
	{
		if(arr[i].val==0)
		{
			freq1++;
		}

		else if(arr[i].val==1)
		{
			freq2++;
		}
	}

	if(freq1>freq2)
	{
		return 0;
	}
	else if(freq2>freq1)
	{
		return 1;
	}
}

int main()
{

	int n=17;
	point arr[n];

	arr[0].x=1;
	arr[0].y=12;
	arr[0].val=0;

	arr[0].x=2;
	arr[0].y=5;
	arr[0].val=0;

	arr[0].x=5;
	arr[0].y=3;
	arr[0].val=1;

	arr[0].x=3;
	arr[0].y=2;
	arr[0].val=1;

	arr[0].x=3;
	arr[0].y=6;
	arr[0].val=0;

	arr[0].x=1.5;
	arr[0].y=9;
	arr[0].val=1;

	arr[0].x=7;
	arr[0].y=2;
	arr[0].val=1;

	arr[0].x=6;
	arr[0].y=1;
	arr[0].val=1;

	arr[0].x=3.8;
	arr[0].y=3;
	arr[0].val=1;

	arr[0].x=3;
	arr[0].y=10;
	arr[0].val=0;
		
	arr[0].x=5.6;
	arr[0].y=4;
	arr[0].val=1;

	arr[0].x=4;
	arr[0].y=2;
	arr[0].val=1;

	arr[0].x=3.5;
	arr[0].y=8;
	arr[0].val=0;

	arr[0].x=2;
	arr[0].y=11;
	arr[0].val=0;

	arr[0].x=2;
	arr[0].y=5;
	arr[0].val=1;

	arr[0].x=2;
	arr[0].y=9;
	arr[0].val=0;

	arr[0].x=1;
	arr[0].y=7;
	arr[0].val=0;

	point p;
	p.x=2.5;
	p.y=7;

	int k=3;

	cout<<"The value of the unknown point is: "<<classifyapoint(arr,n,k,p);
}
