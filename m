From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: Problems with journal size option on mkfs
Date: Wed, 15 May 2002 16:49:33 -0500
Message-ID: <OF2BE1EA14.D1ED3784-ON85256BBA.00775D7B@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10316-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com


Chris Mason wrote:
>On Wed, 2002-05-15 at 16:12, Steve Pratt wrote:
>>
>> I am in the process of writing a File System Interface Module (FSIM) for
>> EVMS that will interface with ReiserFS and am having a problem with the
-s
>> (journal size) option on mkfs.reiserfs.  The problem is that if I
specify
>> any journal size the mkfs fails.  By fails, what I mean is that the
device
>> is not mountable, I don't actually get any error message from mkfs.
This
>> happens even when I give it the default size of 8193 blocks.  I didn't
see
>> anything in the faq about this option not working, but I tried it on 2
>> different machines with the same results.  I am running tools level
3.x.1b
>> and stock 2.4.17 kernel + EVMS + JFS + kgdb + vfslock.
>>
>> Here is a sample of the output, the only line that changes is the
reference
>> to non-standard journal

>The kernel side of the dedicated logging device code has not been sent
>for inclusion in 2.4.x yet.  The beta patch below implements it, against
>2.4.19-pre7.

So the -s option only works with offline log devices?  It doesn't say
anything about this in the man pages.  Also, wouldn't the mkfs code just
ignore this option if you did not specify an external log device (like the
example)?

Just looked at man page again, and it indicates that this should work for
inline logs as well.

Steve

EVMS Development - http://www.sf.net/projects/evms
Linux Technology Center - IBM Corporation
(512) 838-9763  EMAIL: SLPratt@US.IBM.COM


