#include <postgres.h>
#include <fmgr.h>

#ifdef PG_MODULE_MAGIC
    PG_MODULE_MAGIC;
#endif

//typedef unsigned long long uint64;

PG_FUNCTION_INFO_V1(cityhash64);

extern uint64 c_cityhash64(const char *buf, size_t len);

Datum cityhash64(PG_FUNCTION_ARGS)
{
    text *msg = PG_GETARG_TEXT_P(0);

    uint64 result;
    result = c_cityhash64(VARDATA(msg), VARSIZE(msg) - VARHDRSZ);

    PG_RETURN_INT64(result);
}
