Time::DATE_FORMATS[:long_ordinal_meridian] = lambda { |date| date.strftime("%B #{date.day.ordinalize}, %Y %l:%M %p")}
Time::DATE_FORMATS[:short_inbox] = lambda { |date| date.strftime("%m/%d/%Y %I:%M")}
