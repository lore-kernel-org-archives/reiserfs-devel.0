From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: Problems with journal size option on mkfs
Date: Thu, 16 May 2002 09:59:46 -0500
Message-ID: <OF61DE11CE.F7B7B7AE-ON85256BBB.0051CE0D@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10334-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


Oleg Drokin wrote:
>Hello!

>On Wed, May 15, 2002 at 03:12:40PM -0500, Steve Pratt wrote:

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

>This is because non-standard journal support is only included in 2.5
kernel
>series.
>2.4 support is available as separate patch for now.


So just to be sure I understand this:the current 2.4 kernel code (2.4.18)
does not include support for ANY non-standard journal options, including
non default size of an inline log??

If this is true, wouldn't it have made sense to put some checking in the
utilities to detect the level of support in the kernel and either put out a
meaningful error message or simply ignore the option?  As it stands now,
from the command line mkfs doesn't even indicate that there was an error.

Even if the ReiserFS utilities don't check, is there some way I can query
the ReiserFS kernel code to detect the presence of these features?

Steve




