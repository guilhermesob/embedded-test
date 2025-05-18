

#ifndef FILTER_HPP
#define FILTER_HPP




// ===========================================================================
// --- class FilterRC ---
class FilterRC
{
    public:
      FilterRC (float R, float C) :
      
      float frequency() const;
      void setRes(float res);
      void setCap(float cap);
      float getRes() const;
      float getCap() const;
      

    private:
       float resistor, capacitor;
       const float pi = 3.141592;
       
       
}; //end FilterRC






#endif //  FILTER_HPP