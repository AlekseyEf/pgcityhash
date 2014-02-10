#include <postgres.h>
#include <fmgr.h>
#incldue "city.h"

#ifdef PG_MODULE_MAGIC
    PG_MODULE_MAGIC;
#endif

//typedef unsigned long long uint64;

PG_FUNCTION_INFO_V1(cityhash64);

Datum cityhash64(PG_FUNCTION_ARGS)
{
    text *msg = PG_GETARG_TEXT_P(0);

    uint64 result;
    result = CityHash64(VARDATA(msg), VARSIZE(msg) - VARHDRSZ);

    PG_RETURN_INT64(result);
}
