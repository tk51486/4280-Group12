#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <netinet/in.h>
#include <math.h>

int associativity = 1;          // Associativity of cache
int blocksize_bytes = 16;       // Cache Block size in bytes
int cachesize_kb = 16;          // Cache size in KB
int miss_penalty = 30;

void
print_usage ()
{
  printf ("Usage: gunzip2 -c <tracefile> | ./cache -a <assoc> -l <blksz> -s <size> -mp <mispen>\n");
  printf ("  <tracefile>: The memory trace file\n");
  printf ("  -a <assoc>: The associativity of the cache\n");
  printf ("  -l <blksz>: The blocksize (in bytes) of the cache\n");
  printf ("  -s <size>: The size (in KB) of the cache\n");
  printf ("  -mp <mispen>: The miss penalty (in cycles) of a miss\n");
  exit (0);
}

int main(int argc, char * argv []) {

  long address;
  int loadstore, icount;
  char marker;
  
  int i = 0;
  int j = 1;
  // Process the command line arguments
 // Process the command line arguments
  while (j < argc) {
    if (strcmp ("-a", argv [j]) == 0) {
      j++;
      if (j >= argc)
        print_usage ();
      associativity = atoi (argv [j]);
      j++;
    } else if (strcmp ("-l", argv [j]) == 0) {
      j++;
      if (j >= argc)
        print_usage ();
      blocksize_bytes = atoi (argv [j]);
      j++;
    } else if (strcmp ("-s", argv [j]) == 0) {
      j++;
      if (j >= argc)
        print_usage ();
      cachesize_kb = atoi (argv [j]);
      j++;
    } else if (strcmp ("-mp", argv [j]) == 0) {
      j++;
      if (j >= argc)
        print_usage ();
      miss_penalty = atoi (argv [j]);
      j++;
    } else {
      print_usage ();
    }
  }

  /*// print out cache configuration
  printf("Cache parameters:\n");
  printf ("Cache Size (KB)\t\t\t%d\n", cachesize_kb);
  printf ("Cache Associativity\t\t%d\n", associativity);
  printf ("Cache Block Size (bytes)\t%d\n", blocksize_bytes);
  printf ("Miss penalty (cyc)\t\t%d\n",miss_penalty);
  printf ("\n");*/

  int indexWidth = log2((cachesize_kb * 1024)/ blocksize_bytes / associativity);
  int tagWidth = 32 - (indexWidth + log2(blocksize_bytes));

  printf("indexWidth = %d\n", indexWidth);
  printf("tagWidth = %d\n", tagWidth);

  //cache is stored in a 3D array. [number of sets][number of lines][line contents]
  //line indices: [valid][dirty][tag][LRU value]
  uint32_t cache[(cachesize_kb * 1024 / blocksize_bytes)/associativity][associativity][4];
  for (int i = 0; i < ((cachesize_kb * 1024 / blocksize_bytes)/associativity); i++)
  {
    for (int j = 0; j < associativity; j++)
    {
      for (int k = 0; k < 4; k++)
      {
        cache[i][j][k] = 0;
      }
    }
  }
  
  //stat array: dirty evictions, load_misses, store_misses, load_hits, store_hits
  int stats[5];
  for(int i = 0; i < 5; i++){
    stats[i] = 0;
  }
  while (scanf("%c %d %lx %d\n",&marker,&loadstore,&address,&icount) != EOF) {
    // Code to print out just the first 10 addresses.  You'll want to delete
    // this part once you get things going.
    
    if(1){
	    printf("\t%c %d %lx %d\n",marker, loadstore, address, icount);
      uint32_t mask = -1;
      mask = mask << (32 - tagWidth);
      uint32_t tag = address & mask;
      //printf("tag = %u \n", tag);
      mask = -1;
      mask = (mask >> (32 - indexWidth));
      uint32_t index = address & mask;
      //printf("index = %u \n", index);

      int associate = 0;  //line within set
      int hit = 0;
      
      for(int j = 0; j < associativity; j++){
        //checks if the tag is present for the index. also checks the valid bit
        if(tag == cache[index][j][2] && 1 == cache[index][j][0]){
          hit = 1;
          associate = j;
        }
      }

      if(hit){
        //loadstore ? stats[4] = stats[4] + 1 : stats[3] = stats[3] + 1;
        if(loadstore){
          stats[4] = stats[4] + 1;
        }else{
          stats[3] = stats[3] + 1;
        }
      }else{ //on miss
        //loadstore ? stats[2] = stats[2] + 1 : stats[1] = stats[1] + 1;
        if(loadstore){
          stats[2] = stats[2] + 1;
        }else{
          stats[1] = stats[1] + 1;
        }

        for(int j = 0; j < associativity; j++){
          if(cache[index][j][3] > cache[index][associate][3]){
            associate = j;
          }
        }

        cache[index][associate][2] = tag;
        cache[index][associate][0] = 1;
  
        if(cache[index][associate][1] == 1){
          stats[0] += 1;  //dirty eviction
          printf("dirty eviction\n");
          cache[index][associate][1] = 0;
        }
      }//on miss

      for(int j = 0; j < associativity; j++){
        cache[index][j][3] = cache[index][j][3] + 1;
      }
      cache[index][associate][3] = 0;

      //set dirty
      if(loadstore){
        cache[index][associate][1] = 1;
        printf("dirty set\n");
      }
      i++;
    }
    //here is where you will want to process your memory accesses

  }
  // Here is where you want to print out stats
  printf("Lines found = %i \n",i);
  printf("Simulation results:\n");
  //  Use your simulator to output the following statistics.  The 
  //  print statements are provided, just replace the question marks with
  //  your calcuations.
  
  /*
  printf("\texecution time %ld cycles\n", ?);
  printf("\tinstructions %ld\n", ?);
  printf("\tmemory accesses %ld\n", ?);
  printf("\toverall miss rate %.2f\n", ? );
  printf("\tread miss rate %.2f\n", ? );
  printf("\tmemory CPI %.2f\n", ?);
  printf("\ttotal CPI %.2f\n", ?);
  printf("\taverage memory access time %.2f cycles\n",  ?);
  */
  printf("dirty evictions %d\n", stats[0]);
  printf("load_misses %d\n", stats[1]);
  printf("store_misses %d\n", stats[2]);
  printf("load_hits %d\n", stats[3]);
  printf("store_hits %d\n", stats[4]);
  

}
