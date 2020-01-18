# Author Michael Black W9MDB
# This SUPPRESS setting results in no warnings as of 2020-01-14
# There are things that could still be done...especialy in the C++ area
echo "See cppcheck.log when done"
echo "As of cppcheck v1.90 should be one message about missing include files"
echo "This takes several minutes to run"
# We do suppress some errors which are expected or other code
# There are quite a few C++ items to take care of still if anybody cares
SUPPRESS="-i bindings -i lib/getopt.c -i lib/getopt_long.c --suppress=*:gnuradio/demod.h --suppress=*:gnuradio/HrAGC.h --suppress=*:gnuradio/nfm.h --suppress=*:gnuradio/am.h --suppress=*:gnuradio/ssb.h --suppress=*:gnuradio/wfm.h --suppress=*:gnuradio/wfm.h --suppress=*:microtune/i2c.h --suppress=*:microtune/i2cio.h --suppress=*:microtune/i2cio_pp.h --suppress=*:microtune/microtune_4702.h --suppress=*:microtune/microtune_4937.h --suppress=*:microtune/microtune_eval_board.h -i microtune/microtune_eval_board.cc --suppress=*:gnuradio/HrAGC.h --suppress=knownConditionTrueFalse:tests/rotctl.c --suppress=knownConditionTrueFalse:tests/rigctl.c --suppress=knownConditionTrueFalse:tests/ampctl.c --suppress=knownConditionTrueFalse:tests/rotctl_parse.c --suppress=knownConditionTrueFalse:tests/rigctl_parse.c --suppress=knownConditionTrueFalse:tests/ampctl_parse.c"
CHECK="-D RIG_LEVEL_LINEOUT=1 -D SIGPIPE -D SIGINT -D IPV6_V6ONLY -D RIG_MODE_WFM -D ABI_VERSION=4 -D F_SETSIG=1 -U O_ASYNC -U SA_SIGINFO -U HASH_BLOOM -U HASH_EMIT_KEYS -U HASH_FUNCTION -U __USEP5P6__"
cppcheck -q --force --enable=all --std=c99 $SUPPRESS $CHECK . &>cppcheck.log
