From: Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>
Subject: Re: [PATCH] reiserfs:fix journaling issue regarding fsync()
Date: Mon, 26 Jun 2006 13:39:01 +0900
Message-ID: <6.0.0.20.2.20060626095550.041272e0@172.19.0.2>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
 <1151057737.6355.28.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1151057737.6355.28.camel@tribesman.namesys.com>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
 <1151057737.6355.28.camel@tribesman.namesys.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiser@namesys.com, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org


At 19:15 06/06/23, Vladimir V. Saveliev wrote:
 >Hello
 >
 >Sorry, but afaics reiserfs' fsync works as it is supposed to.
 >I experiment with the attached program. After reboot I make sure that
 >file has "new file size".
 >

I modified your program shown as below.The only difference is that a for
loop is added. Write() and fsync() tests are repeated 100times.

#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>

int main(int argc, char **argv)
{
	int fd,i;
	struct stat st;

	fd = open(argv[1], O_WRONLY | O_APPEND);
	if (fd == -1) {
		perror("open failed");
		return 0;
	}
	if (fstat(fd, &st)) {
		perror("stat failed");
		return 0;
	}
	printf("old file size %d\n", st.st_size);
	for(i=0;i<100;i++) {
		if (write(fd, "hello", 5) != 5) {
			perror("write failed");
			return 0;
		}

		if (fstat(fd, &st)) {
			perror("stat failed");
			return 0;
		}
		printf("new file size %d\n", st.st_size);
		if (fsync(fd)) {
			perror("fsync failed");
			return 0;
		}
	}
	printf("rebooting"); fflush(stdout);
	system("reboot -f -n");
	return 0;
}

I tested with this program toward reiserfs (2.6.17 and 2.6.17 with my patch).
After I made an empty file, I run this program.
I performed this test 10times each.
Following results are obtained.

				success 	fail
2.6.17			5		5
2.6.17 with my patch	10		0

"Success" means that file size is 500bytes after reboot.
"Fail" means that file size is less than 500bytes after reboot.

So, this result showed that my patch is needed.

Thanks. 

