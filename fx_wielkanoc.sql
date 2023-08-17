create or replace function fx_wielkanoc 
(
  year_in in number
)  return date as 
lv_marzec number;
lv_kwiecien number;
lv_wyn date;

begin
lv_marzec:=22+mod(19*mod(year_in,19)+24,30)+mod((2*mod(year_in,4) + 4*mod(year_in,7) + 6*mod(19*mod(year_in,19)+24,30) + 5),7);
lv_kwiecien :=mod(19*mod(year_in,19)+24,30)+mod((2*mod(year_in,4) + 4*mod(year_in,7) + 6*mod(19*mod(year_in,19)+24,30) + 5),7)-9;
IF lv_marzec<32 then  
lv_wyn:=to_date(year_in||'-03-'||to_char(lv_marzec,'00'),'yyyy-mm-dd');
ELSE
lv_wyn:=to_date(year_in||'-04-'||to_char(lv_kwiecien,'00'),'yyyy-mm-dd');
end if;
  return lv_wyn ;
end fx_wielkanoc;
