From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: reiser4 OOPSes and panics when out of memory
Date: Tue, 18 Jul 2006 00:52:07 -0600
Message-ID: <1153205527.9866.20.camel@gentoo>
References: <63591.70.224.221.228.1153071893.squirrel@people.msoe.edu>
	 <1153145428.6311.43.camel@tribesman.namesys.com>
	 <1153157891.6311.71.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-8CmlfhaRIBq22PCKXFcS"
Return-path: <reiserfs-list-return-29055-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153157891.6311.71.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--=-8CmlfhaRIBq22PCKXFcS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks for the patch, but I can still reproduce the problem. I've been
running the attached program to try to speed up the testing process a
bit. Interrupting and restarting the compilation loop also seems to
help.

If I had hours to wait, it would probably crash eventually without
additional encouragement, but I'm doing everything as an unprivileged
user, so I don't think my tests are unreasonable.

Anyway, I'm still getting a panic with debug enabled:

reiser4 panicked cowardly: reiser4[find(16411)]: reiser4_dirty_inode (fs/reiser4/super_ops.c:173)[]:
Kernel panic - not syncing: reiser4[find(16411)]: reiser4_dirty_inode (fs/reiser4/super_ops.c:173)[]:

Without debug enabled I've seen:

http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060718/messages1.txt.gz
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060718/fsck1_--check.txt.gz
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060718/fsck1_--fix.txt.gz
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060718/fsck1_--check_after_--fix.txt.gz

but usually I get:

http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060718/messages3.txt.gz

with no corruption (although I've been rebooting before complete
failure).

On Mon, 2006-07-17 at 21:38 +0400, Vladimir V. Saveliev wrote:
> Hello
> 
> On Mon, 2006-07-17 at 18:10 +0400, Vladimir V. Saveliev wrote:
> > Hello
> > 
> > On Sun, 2006-07-16 at 12:44 -0500, maciejej@msoe.edu wrote:
> > > Has my previous post
> > > (http://marc.theaimsgroup.com/?l=reiserfs&m=115259665831650&w=2) been
> > > overlooked, or have I not provided enough information? Do I need to
> > > reproduce these issues on 2.6.18-rc1-mm2? Should I be trying any patches?
> > > 
> > 
> 
> please try the attached patch.
> 
> > your test crashes reiser4 on my test box. I hope to get a patch ready
> > later today. Not sure that I got the same problem as you, though. We
> > will see. 
> > 
> > > The bottom line is with 2.6.17-mm6, I've always been able to OOPs or panic
> > > reiser4 on my amd64 machine (haven't tried x86 yet) by using all available
> > > physical memory.
> > > 
> > > 
> > 
> > 
-- 
Jake Maciejewski <maciejej@msoe.edu>

--=-8CmlfhaRIBq22PCKXFcS
Content-Disposition: attachment; filename=waste_memory.c
Content-Type: text/x-csrc; name=waste_memory.c; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

#include <sys/sysinfo.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

#define MB 1048576
#define DEFAULT_SAVE 0
#define DELAY 10

int main(int argc, char *argv[]) {

struct sysinfo info;
size_t waste, save;
void *ptr;

sysinfo(&info);

if(argc>1)
	save = atoi(argv[1])*MB;
else
	save = DEFAULT_SAVE*MB;

if( save >= info.freeram ) {
	fprintf(stderr, "error: only %iMB free\n", (int)info.freeram/MB);
	return ENOMEM;
	}

while(1) {
	sysinfo(&info);
	waste = (info.freeram-save)>0 ? info.freeram-save : 0;

	ptr = malloc(waste);
	if( ptr == 0 ) {
		perror("malloc() failed\n");
		return ENOMEM;
		}

	printf("reserving %iMB, wasting %iMB\n", (int)save/MB, (int)waste/MB);
	memset(ptr, 0, waste);

	sleep(DELAY);
	free(ptr);
	}

return 0;
}

--=-8CmlfhaRIBq22PCKXFcS--

