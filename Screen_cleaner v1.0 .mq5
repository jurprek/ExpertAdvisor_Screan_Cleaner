//+------------------------------------------------------------------+
//|                   Expert Advisor source c0de: Screen_cleaner v1.0|
//|                                        by:      Jurica Preksavec |
//|                                                jurprek@gmail.com |
//+------------------------------------------------------------------+

//-------------------------------------------------------------------------------------------->>>
#property copyright "Jurica Preksavec"
#property link      "jurprek@gmail.com"
#property version   "1.00"
#include <Trade\Trade.mqh>

CTrade trade;
enum MODE {EVERY_TICK,EVERY_SEC};

 string BS="---------BASIC SETTING---------";
 MODE CheckMode=EVERY_TICK;//Checking Mode

//-----------------------------------------------------------------------------------------------

int OnInit(){//------------------------------------------------------------------------------->>>
//---

   return(INIT_SUCCEEDED);
}//----------------------------------------------------------------------------------------------

int DayOfWeek(){//---------------------------------------------------------------------------->>>
   MqlDateTime tm;
   TimeCurrent(tm);
   return(tm.day_of_week);
}//----------------------------------------------------------------------------------------------

void OnDeinit(const int reason){//------------------------------------------------------------>>>
   EventKillTimer();
}//----------------------------------------------------------------------------------------------

void OnTimer(){//----------------------------------------------------------------------------->>>
   if(CheckMode==EVERY_SEC)
      CheckForEntry();
}//----------------------------------------------------------------------------------------------

void OnTick(){//------------------------------------------------------------------------------>>>

   if(CheckMode==EVERY_TICK)
      CheckForEntry();   
}//---------------------------------------------------------------------------------------------- 

void CheckForEntry(){//----------------------------------------------------------------------->>>

      ObjectsDeleteAll(ChartID());
      PlaySound("alert.wav");
}

//-------------------------------------------------------------------------------------end c0de.