#include <iostream>
#include <iomanip>
#include "FilterRC.hpp"


using namespace std;





// ==========================================================================
// --- Main Function ---
int main()
{
  FilterRC filter1(1500.0,10.0E-9);
  
  float freq;

  cout << fixed << setprecision(2);

  freq = filter1.frequency();
  cout <<" Frequency: " << freq << " Hz";

  filter1.setRes(10000.0);

  freq = filter1.frequency();
  cout <<" Frequency: " << freq << " Hz";

  filter1.setCap(47.0e-9);
  cout <<" Frequency: " << freq << " Hz";






  cout << "\n End of Program." << endl;
  return 0;

} // end main