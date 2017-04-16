/* C++ code produced by gperf version 3.0.3 */
/* Command-line: gperf -L C++ -E -t /private/var/folders/rb/k66tqww10cs_2jrs86wxgq800000gn/T/benjamin/timely-generated/KrollGeneratedBindings.gperf  */
/* Computed positions: -k'' */

#line 3 "/private/var/folders/rb/k66tqww10cs_2jrs86wxgq800000gn/T/benjamin/timely-generated/KrollGeneratedBindings.gperf"


#include <string.h>
#include <v8.h>
#include <KrollBindings.h>

#include "ti.mely.TimelyModule.h"
#include "ti.mely.TimerProxy.h"


#line 14 "/private/var/folders/rb/k66tqww10cs_2jrs86wxgq800000gn/T/benjamin/timely-generated/KrollGeneratedBindings.gperf"
struct titanium::bindings::BindEntry;
/* maximum key range = 3, duplicates = 0 */

class TimelyBindings
{
private:
  static inline unsigned int hash (const char *str, unsigned int len);
public:
  static struct titanium::bindings::BindEntry *lookupGeneratedInit (const char *str, unsigned int len);
};

inline /*ARGSUSED*/
unsigned int
TimelyBindings::hash (register const char *str, register unsigned int len)
{
  return len;
}

struct titanium::bindings::BindEntry *
TimelyBindings::lookupGeneratedInit (register const char *str, register unsigned int len)
{
  enum
    {
      TOTAL_KEYWORDS = 2,
      MIN_WORD_LENGTH = 18,
      MAX_WORD_LENGTH = 20,
      MIN_HASH_VALUE = 18,
      MAX_HASH_VALUE = 20
    };

  static struct titanium::bindings::BindEntry wordlist[] =
    {
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
#line 17 "/private/var/folders/rb/k66tqww10cs_2jrs86wxgq800000gn/T/benjamin/timely-generated/KrollGeneratedBindings.gperf"
      {"ti.mely.TimerProxy", ::ti::mely::timely::TimerProxy::bindProxy, ::ti::mely::timely::TimerProxy::dispose},
      {""},
#line 16 "/private/var/folders/rb/k66tqww10cs_2jrs86wxgq800000gn/T/benjamin/timely-generated/KrollGeneratedBindings.gperf"
      {"ti.mely.TimelyModule", ::ti::mely::TimelyModule::bindProxy, ::ti::mely::TimelyModule::dispose}
    };

  if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
    {
      register int key = hash (str, len);

      if (key <= MAX_HASH_VALUE && key >= 0)
        {
          register const char *s = wordlist[key].name;

          if (*str == *s && !strcmp (str + 1, s + 1))
            return &wordlist[key];
        }
    }
  return 0;
}
#line 18 "/private/var/folders/rb/k66tqww10cs_2jrs86wxgq800000gn/T/benjamin/timely-generated/KrollGeneratedBindings.gperf"

