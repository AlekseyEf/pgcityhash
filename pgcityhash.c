#include <postgres.h>
#include <fmgr.h>
#include "city.h"

#ifdef PG_MODULE_MAGIC
    PG_MODULE_MAGIC;
#endif

PG_FUNCTION_INFO_V1(cityhash);

Datum cityhash(PG_FUNCTION_ARGS)
{
    text *msg = PG_GETARG_TEXT_P(0);

    uint64 result;
    result = CityHash64(VARDATA(msg), VARSIZE(msg) - VARHDRSZ);

    PG_RETURN_INT64(result);
}
