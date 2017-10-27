import java.util.Scanner;  


class BinarySearch
{


    public int Search(int array[], int left, int right, int key)
    {
	int flag = 0;
	while(left <= right)
	{
		int mid = ( left + right ) / 2;
		if(key == array[mid])
		{
			flag = 1;
			break;	
		}
		else if(key < array[mid])
		{
			right = mid - 1;
		}
		else 
		{
			left = mid + 1;
		}
	}
	return(flag);
    }

    public static void main(String args[])
    {
        BinarySearch binarySearch = new BinarySearch();
        Scanner scanner = new Scanner(System.in);

        int arraySize;
        int array[];

        System.out.println("Enter Size of the Array-");
        arraySize = scanner.nextInt();
        array = new int[arraySize];

        System.out.println("Enter array Elements-");
        for(int i=0;i<arraySize;i++)
        {
            array[i] = scanner.nextInt();
        }

        System.out.println("Enter Key to be searched -");
        int key = scanner.nextInt();
        int position = binarySearch.Search(array,0,arraySize-1,key);
	if(position == 1)
        	System.out.println("Element Found at -"+position+1);
	else 
		System.out.println("Element Not Found");
    }
    
}
