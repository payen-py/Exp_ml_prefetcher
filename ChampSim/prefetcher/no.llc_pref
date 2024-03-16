#include "cache.h"

// for collect llc access
# include <fstream>
# include <stdlib.h>
ofstream myfile;

void CACHE::llc_prefetcher_initialize()
{
  // for collect llc access
  myfile.open("./no_pref.txt");
}

uint32_t CACHE::llc_prefetcher_operate(uint64_t addr, uint64_t ip, uint8_t cache_hit, uint8_t type, uint32_t metadata_in, uint64_t instr_id, uint64_t curr_cycle)
{
  // for collect llc access
  if (cache_hit == 0 && instr_id != 0) {
	myfile << dec << instr_id << ", " << curr_cycle << ", " << hex << addr << ", " << ip << ", 0" << endl;
  }


  return metadata_in;
}

uint32_t CACHE::llc_prefetcher_cache_fill(uint64_t addr, uint32_t set, uint32_t way, uint8_t prefetch, uint64_t evicted_addr, uint32_t metadata_in)
{
  return metadata_in;
}

void CACHE::llc_prefetcher_final_stats()
{
	// close file
	myfile.close();
}
