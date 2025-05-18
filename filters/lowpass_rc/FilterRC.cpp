
#include "FilterRC.hpp"



FilterRC::FilterRC (float R, float C) :
resistor(R) , capacitor(C)
{

}


float FilterRC::frequency() const;
{
   return 1/(2*pi*resistor*capacitor);
}


void FilterRC::setRes(float res)
{
    resistor = res;
}

void FilterRC::setCap(float cap)
{
    capacitor = cap;
}

float FilterRC::getRes() const
{
    return resistor;
}

float FilterRC::getCap() const
{
    return capacitor;
}