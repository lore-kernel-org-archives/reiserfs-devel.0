From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs-3.6.12 release
Date: Thu, 12 Feb 2004 01:34:20 +0300
Message-ID: <200402120134.20591.vitaly@namesys.com>
References: <200402102010.04479.vitaly@namesys.com> <20040211170250.GA8237@lostlogicx.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_s3qKAE32lD1lOlr"
Return-path: <reiserfs-list-return-16766-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040211170250.GA8237@lostlogicx.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Brandon Low <lostlogic@gentoo.org>
Cc: reiserfs-list@namesys.com

--Boundary-00=_s3qKAE32lD1lOlr
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 11 February 2004 20:02, Brandon Low wrote:
> This release gives me:
>
> Partition /dev/hda3 is mounted with write permissions, cannot check it
>
> When I try to run fsck.reiserfs /dev/hda3 during bootup when the fs is
> mounted readonly.  I have used init=/bin/bash and confirmed this result
> interactively...

this is strange, would you also try to confirm the result by running this 
test program on bootup with init=/bin/bash and tell me what it says?

-
Thanks,
Vitaly Fertman

--Boundary-00=_s3qKAE32lD1lOlr
Content-Type: text/x-csrc;
  charset="iso-8859-1";
  name="updatetime.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="updatetime.c"

#include <stdio.h>
#include <errno.h>
#include <utime.h>
#include <sys/types.h>

static int misc_file_ro(char *file) {
	if (utime(file, 0) == -1) {
		if (errno == EROFS)
			return 1;
	}
	
	return 0;
}

int main(int argc, char * argv []) {
	if (argc !=2) {
		fprintf(stderr, "Usage: %s mount_point\n", argv[0]);
		return -1;
	}
	
	 if (misc_file_ro(argv[1]) == 1)
		 printf("RO\n");

	 return 0;
}

--Boundary-00=_s3qKAE32lD1lOlr--

