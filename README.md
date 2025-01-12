# Pizza Store Analysis
![image](https://github.com/user-attachments/assets/02eac13a-edc5-4ead-9af8-c7ffaeb88bea) <br>

- Left hand side cards are dynamic that will change when sales increase for any month, day or Pizza Category.<br>
- Dax Queries for the Dynamic Cards:<br>
    1. Busiest_Days = 
    var BusyDay = TOPN(1,VALUES(pizza_sales[DayNameFull]),[Total Orders],DESC)
    return FIRSTNONBLANK(BusyDay,1)
    2. Busiest_Month = 
    var BusyMonth = TOPN(1,VALUES(pizza_sales[FullMonthName]),[Total Orders],DESC)
    return FIRSTNONBLANK(BusyMonth,1)
    3. TopSellingPizzaCate = 
    var TopPizzaCate = TOPN(1,VALUES(pizza_sales[pizza_category]),[Total Orders],DESC)
    return FIRSTNONBLANK(TopPizzaCate,1)

![image](https://github.com/user-attachments/assets/2296acf1-5c78-4ddf-9e2c-49945f617562) <br>

- Edited Interactions for the Cards on the left side.
- The slicer wont interact with the cards the values would only when there is overall change in the sales and revenue.
- ![image](https://github.com/user-attachments/assets/e7cc2d25-8da1-41b9-91e4-cc383d018191)


