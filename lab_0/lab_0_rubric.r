item 1:
	-1 point if the R code successfully reads-in the stock_prices
		dataset and reports 4,680 observations. this must be both
		reported at the commmand prompt, and documented as a comment
		below the code element
	-0.5 points if the file is successfully read-in, but the number
		of observations are reported once only (either at the 
		command prompt, or as a comment, but not both)
	-0 points otherwise

item 2: 
	-1 point if successfully coercing the class of the date column
		via as.Date or equivalent function. this must be reported
		at the command prompt
	-0.5 points if date variable is sucessfully converted, but 
		the class was not reported at the command prompt
	-0 points otherwise
	
item 3: 
	-1 point if the R code successfully counts the number of
		companies in the dataset as 2, and the companies are
		correctly identified as Eli Lilly and Novo Nordisk. 
		this must be both reported at the commmand prompt, and 
		documented as a comment below the code element
	-0.5 point if the proper results were obtained but reported
		only once (either at command prompt, or via comment, 
		but not both)
	-0 points otherwise

item 4:
	-1 point if successfully finding that the median trading 
		volume for Eli Lilly is 3.1M shares per day, and the 
		median trading value for Novo Nordisk is 3.0M shares
		per day. these results must be both reported at the 
		commmand prompt, and documented as a comment below 
		the code element. can report as "median shares per
		day", or "median daily shares" or equivalent. the 
		results can be reported as raw value in shares units, 
		or can be summarized as a value to the nearest tenth of a
		million
	-0.5 point if the proper values were calculated but reported
		only once (either at command prompt, or via comment, 
		but not both). also 0.5 point credit is the maximum
		allowable for results reported without units (here: 
		shares per day, or equivalent information). also
		0.5 point credit is the maximum allowable if the 
		average was calculated, or if the median was reported
		as the average or the mean
	-0 points otherwise
	
item 5: 
	-1 point if successfully finding that the day with the
		highest volume of trading occured july 29, 2025 within
		the Novo-Nordisk company, and that the trading volume
		on that day was between 110 and 111 million shares. 
		these results must be both reported at the commmand 
		prompt, and documented as a comment below the code 
		element. the results can be reported as raw value in 
		shares units, or can be summarized as a value to the 
		nearest million
	-0.5 point if only partial results were reported (not all-three
		of: date, company, and trading volume), or if the proper 
		values were calculated but reported only once (either at 
		command prompt, or via comment, but not both). also 0.5 
		point credit is the maximum allowable for results reported 
		without units (here: the value of 110 or 111 must be
		accompanied by some indication of millions of shares)
	-0 points otherwise
	
item 6: 
	-1 point if successfully finding that the day with the
		largest same-day loss occured july 18, 2024 within
		the Eli Lilly company, and that the percentage drop
		was between -6.3 and -6.5 percent. these results must 
		be both reported at the commmand prompt, and documented 
		as a comment below the code element
	-0.5 point if only partial results were reported (not all-three
		of: date, company, and percent drop), or if the proper 
		values were calculated but reported only once (either at 
		command prompt, or via comment, but not both). also 0.5 
		point credit is the maximum allowable for results reported 
		without units (here: a value between -0.063 and -0.065 is
		acceptable, but a value of 6.3, 6.4, or 6.5 requires a
		percent indicator)
	-0 points otherwise
	
item 7: 
	-1 point if successfully finding that the largest day-to-day
		jump occurred april 16, 2025 within the Eli Lilly company, 
		and that the jump was 14.3%. these results must be both 
		reported at the commmand prompt, and documented as a comment 
		below the code element. it is OK if the diff() function is
		used across the entire dataset: this is a challenge problem
		for beginner coders
	-0.5 point if only partial results were reported (not all-three
		of: date, company, and value jump), or if the proper 
		values were calculated but reported only once (either at 
		command prompt, or via comment, but not both). also 0.5 
		point credit is the maximum allowable for results reported 
		without units (here: a value of 0.143 is acceptable, but a 
		value of 14.3 requires a percent indicator)
	-0 points otherwise
	

item 8: 
	-1 point if successfully generating a line-plot with a title
		that reflects the company name, an x-label that reflects
		the date variable, and a y-label that reflects the stock
		price/value variable
	-0.5 point if line plot missing one or more annotations (title,
		x-label, or y-label), or a plot other than line-plot
	-0 points otherwise
