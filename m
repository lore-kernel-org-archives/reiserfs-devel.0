From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser3 and O_DIRECT read
Date: Tue, 11 Oct 2005 10:10:33 +0400
Message-ID: <434B5759.1090604@namesys.com>
References: <Pine.LNX.4.61.0510071208030.1805@dacun.noviforum.si> <4346784A.1050208@namesys.com> <Pine.LNX.4.61.0510101223390.3955@dacun.noviforum.si> <434A5D19.2030006@namesys.com> <Pine.LNX.4.61.0510101428500.3955@dacun.noviforum.si> <434A67EB.5070600@namesys.com> <Pine.LNX.4.61.0510101734440.3955@dacun.noviforum.si>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020600070204010203080205"
Return-path: <reiserfs-list-return-26467-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.61.0510101734440.3955@dacun.noviforum.si>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Gorazd Golob <gorazdg@noviforum.si>
Cc: reiserfs-list@namesys.com

--------------020600070204010203080205
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello

Gorazd Golob wrote:
> 
> It doesn't work right - your example :(
> 
> Our programmers said that ssize_t type should be used instead of size_t
> for rd variable..
> 

ok, yes, I agree. But it should not change anything.
Please try new version. It works fine here. How does it behave on your side?

> in code is:
> 
> size_t rd;
> 
> 
> tnx, gorazd
> 
> 
> On Mon, 10 Oct 2005, Vladimir V. Saveliev wrote:
> 
>> Hello
>>
>> Gorazd Golob wrote:
>>>
>>>
>>> On Mon, 10 Oct 2005, Vladimir V. Saveliev wrote:
>>>
>>>>
>>>> Does it work on ext2?
>>> Yes it work on ext2, ext3, xfs ..
>>>
>>>> Are you sure that file offset is properly aligned?
>>> Yes ..
>>>
>> Would you please try whether the attached program works for you?
>>
>>>
>>>>
>>>>> Without O_DIRECT works fine as said in previous mails. Write with
>>>>> O_DIRECT works fine. Kernel version is:
>>>>> Linux xxxx 2.6.12.6 #6 SMP Thu Sep 15 12:29:53 CEST 2005 x86_64
>>>>> Intel(R)
>>>>> Xeon(TM) CPU 3.00GHz GenuineIntel GNU/Linux
>>>>>
>>>>> please let me know if you need more info.
>>>>>
>>>>> tnx, Gorazd
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>>> Or in other words is reiserfs3 supporting reading with O_DIRECT
>>>>>>> flag?
>>>>>>> Writing works well with 0_DIRECT on reiserfs3.
>>>>>>>
>>>>>>> Gorazd
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>
>>>>
>>>
>>>
>>
>>
> 
> 


--------------020600070204010203080205
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

	if (argc != 2) {
		printf("%s filename\n", argv[0]);
		return 0;
	}
	fd = open(argv[1], O_RDONLY | O_DIRECT);
	if (fd == -1) {
		perror("open failed");
		return 0;
	}
	if (posix_memalign((void **)&buf, 4096, 4096)) {
		perror("malloc failed");
                return 0;
	}
	rd = read(fd, buf, 4096);
	if (rd != 4096) {
                perror("read failed");
                return 0;
	}
	printf("read ok\n");
	free(buf);
	close(fd);
	return 0;
}

--------------020600070204010203080205--
