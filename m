From: Menno Smits <menno@netbox.biz>
Subject: Repeatable corruption using Reiserfs 3
Date: Thu, 30 Oct 2003 16:04:09 +1000
Message-ID: <3FA0A9D9.70705@netbox.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15937-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I've managed to cause repeatable file corruption using Reiserfs 3 and 
have developed a simple test program to demonstrate.

Here's the background info:

Reiserfs version: v3.6.25 using the v3.6 filesystem (r5 hash)
Kernel version: have tested with Redhat 7.3 kernel 2.4.18-3 and vanilla 
2.4.21 kernel.
Hardware: have tested repeatedly on 3 different i386 boxes of varying 
specs and age.

Procedure:
- Compile the C program included below
- Change to a directory on a Reiserfs partition with a few 100MB of free
   space
- Run the program. It will create three files "1", "2" and "3" which
   each get filled with endless lines of repeated numbers corresponding
   to the file name.
- When the program says to pull the power, rip the power cable out of
   the back of the PC to simulate a power failure.
- Plug the power back in and wait for system to reboot.
- Change back to the directory where the test files where created.
- Examine the head of the files. You should get something like this:

$ head -5 [0-2]
==> 0 <==
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

==> 1 <==
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

==> 2 <==
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2

- The result is expected and correct. Now look at the tail of the files.
   The results vary on every run of the test but the contents of the
   output files are always wrong. Two examples are:

$ tail -5 [0-2]
==> 0 <==
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
==> 1 <==
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1
==> 2 <==
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1

$ tail -5 [0-2]
==> 0 <==
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
==> 1 <==
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1
==> 2 <==
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

Clearly there is something rather bad happening here. I can understand 
  data not making it to disk but _not_ incorrect data being present.

I also have repeated these tests many times on the ext3 filesystem using 
its ordered mode (default) on the same hardware. In this case the files 
always contain the correct data (that is 0 contains only "0"s, 1 
contains "1"s and 2 contains "2"s). I couldn't fault it once whereas the 
tests on reiserfs always caused corrupt.

The reason I started doing this testing is because I was seeing major 
corruption is various configuration files and Postgresql databases that 
were being written to during a power failure. The configuration files 
were being totally replaced with unrelated data from other parts of the 
disk. I believe these tests show there is a genuine problem here.

I would appreciate any comments on this as well as feedback from anyone 
else trying these tests.

Regards,
Menno Smits

Test program used to test reiser (dubbed "reiserkill").
I used "gcc -Wall -o reiserkill reiserkill.c"  to compile.
----< SNIP >--------------------------------------------------------
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>

#define NUM_CHILDREN 3
#define ITEMS_PER_LINE 20

void child(int index)
{
     FILE *f;
     char outname[PATH_MAX];
     char oneitem[10];
     char *linebuf;
     int i;

     /* Prebuffer one line */
     sprintf(oneitem, "%d ", index);
     linebuf = malloc(ITEMS_PER_LINE * strlen(oneitem) + strlen("\n") + 1);
     for (i=0; i<ITEMS_PER_LINE; i++)
         strcat(linebuf, oneitem);
     strcat(linebuf, "\n");

     /* Open output file and dump output endlessly */
     sprintf(outname, "%d", index);
     f = fopen(outname, "w");

     while (1) {
         fputs(linebuf, f);
         fflush(f);
     }
}

int main()
{
     int i;

     for (i=0; i<NUM_CHILDREN; i++)
         if (fork() == 0) child(i);

     printf("Dumping data to disk. Please wait...\n");
     sleep(15);
     printf("Pull the power now!\n");

     while (1) pause();

     return 0;
}
----< SNIP >--------------------------------------------------------

