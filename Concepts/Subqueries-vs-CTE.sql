### Find companies that have at least 2 users who speak both English and German.

```
select company_id from company_users
where user_id in (
select user_id from company_users
where language in ('english','german')
group by user_id
having COUNT(distinct language)=2)
group by company_id
having COUNT(distinct user_id)>=2
```

