From: Alexy Khrabrov <list+reiserfs@setup.org>
Subject: Re: assembling a file out of debugreiserfs's map
Date: Fri, 28 May 2004 16:20:54 -0400
Message-ID: <20040528202054.GA14543%alexy.khrabrov@setup.org>
References: <20040528165533.GA12618%alexy.khrabrov@setup.org> <20040528192320.GA14111%alexy.khrabrov@setup.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="wRRV7LY7NUeQGEoC"
Return-path: <reiserfs-list-return-18896-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040528192320.GA14111%alexy.khrabrov@setup.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=windows-1251
Content-Disposition: inline


OK, I've restored the missing file, here's just to sum up what I've done
so it may help others.

1.  debugreiserfs -n <filename> -a file.map /dev/device
2.  debugreiserfs -f -a file.map /dev/device
3.  [read around this thread for Vladimir's explanation of 
     debugreiserfs output format...]

    saw these lines with data blocks:

block 8142, item 0: 2572 2573 0x1 IND (1), len 3256, location 192 entry count 0, fsck need 0, format new
814 pointers
[ 2054932(814)]
block 1271, item 0: 2572 2573 0x32e001 IND (1), len 228, location 3868 entry count 0, fsck need 0, format new
57 pointers
[ 2055746(9) 2055756(48)]

    and assembled like this:

dd if=/dev/lev/raid bs=4096 count=814 skip=2054932 of=new.jpg
dd if=/dev/lev/raid bs=4096 count=9   skip=2055746 >> new.jpg
dd if=/dev/lev/raid bs=4096 count=48  skip=2055756 >> new.jpg

4.  Saw the size of the original in the metadata line:

(NEW SD), mode -r-xr--r--, size 3563604, nlink 1, mtime 27/2004 11:25:38 blocks 6968, uid 500

and truncated the file to that size with a wrapper script around the
system truncate call (man 2 truncate), attached:

truncate new.jpg 3563604

et voila!

Thanks to Vladimir, Vitaly, the author Hans Reiser of course, and all
the great team at ReiserFS.  I use it since SuSE 7.1/2001 and am very
happy with it!

-- 
Cheers,
Alexy Khrabrov :: www.setup.org :: Age Quod Agis

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=windows-1251
Content-Disposition: attachment; filename="truncate.c"

#include <unistd.h>
#include <stdio.h>

int main(int argc, char **argv)
{
  int ex;
  
  if (argc !=3) {
    printf("usage: %s <file> <new size>\n", argv[0]);
    exit(1);
  }

  ex = truncate(argv[1], atol(argv[2]));

  if (!ex)
    printf("%s is now %s bytes long\n", argv[1], argv[2]);
  else
    printf("ERROR!");

  return(ex);
}  
     
				

--wRRV7LY7NUeQGEoC--
