From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser3 and O_DIRECT read
Date: Tue, 11 Oct 2005 11:30:35 +0400
Message-ID: <434B6A1B.4030702@namesys.com>
References: <Pine.LNX.4.61.0510071208030.1805@dacun.noviforum.si> <4346784A.1050208@namesys.com> <Pine.LNX.4.61.0510101223390.3955@dacun.noviforum.si> <434A5D19.2030006@namesys.com> <Pine.LNX.4.61.0510101428500.3955@dacun.noviforum.si> <434A67EB.5070600@namesys.com> <Pine.LNX.4.61.0510101734440.3955@dacun.noviforum.si> <434B5759.1090604@namesys.com> <Pine.LNX.4.61.0510110834110.3955@dacun.noviforum.si>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030501080304020005070005"
Return-path: <reiserfs-list-return-26469-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.61.0510110834110.3955@dacun.noviforum.si>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Gorazd Golob <gorazdg@noviforum.si>
Cc: reiserfs-list@namesys.com

--------------030501080304020005070005
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello

Gorazd Golob wrote:
> 
> ;(
> 
> works ok if file is bigger than about 4000 bytes. Otherwise read failed.
> 
Yes, using O_DIRECT you should care about alignment to boundary of 512 bytes for
address of buffer you read to, size of that buffer and offset in a file to read
from.

Please try this version of test program and let us know how to make it to behave
differently for file in reiserfs and ext2.
What is version of kernel you use?

--------------030501080304020005070005
Content-Type: text/x-c;
 name="test-direct-io.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="test-direct-io.c"

#define _XOPEN_SOURCE 600
#include <stdio.h>
#include <unistd.h>
#include <malloc.h>
#include <stdlib.h>
#include <fcntl.h>

#define O_DIRECT   040000

int main(int argc, char **argv)
{
	int fd;
	ssize_t rd;
	char *buf;
	size_t size;

	if (argc != 3) {
		printf("%s filename nr\n", argv[0]);
		return 0;
	}
	fd = open(argv[1], O_RDONLY | O_DIRECT);
	if (fd == -1) {
		perror("open failed");
		return 0;
	}
	size = atoi(argv[2]);

	if (posix_memalign((void **)&buf, 512, size)) {
		perror("malloc failed");
                return 0;
	}
	rd = read(fd, buf, size);
	if (rd != size) {
                perror("read failed");
                return 0;
	}
	free(buf);
	close(fd);
	return 0;
}

--------------030501080304020005070005--
