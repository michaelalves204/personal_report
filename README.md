## Alias para linux

```bash
alias report='ruby personal_report/lib/report/info.rb'
alias personal_report='function personal_report(){ cat personal/"$1"/"$2i" | jq; }; personal_report'
alias dm_report='function dm_report(){ cat dm/"$1"; }; dm_report'
```