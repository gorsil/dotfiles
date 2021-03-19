#!/bin/zsh
curl http://iss.moex.com/iss/statistics/engines/futures/markets/indicativerates/securities 2> /dev/null | grep USD/RUB | grep -o -P --color=never '(\d*\.\d{3})'
