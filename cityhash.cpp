#include "city.h"

extern "C" {
  uint64 c_cityhash64(const char *buf, size_t len) {
    return CityHash64(buf, len);
  }
}
