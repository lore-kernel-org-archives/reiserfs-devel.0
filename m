From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: A couple of questions
Date: Thu, 16 May 2002 10:11:37 -0500
Message-ID: <OF4598EC34.B53F2A48-ON85256BBB.00531156@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10337-reiserfs=m.gmane.org@namesys.com>
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

>On Wed, May 15, 2002 at 04:22:22PM -0500, Steve Pratt wrote:

>> A couple of questions about the ReiserFS utilities.  First, does
ReiserFS
>> support labels or not?  FAQ says no and refers to lack of space in the
3.5
>> superblock. Neither 3.5 nor 3.6 superblock appear to have a label field,
>> but mkfs has an option for it.

>Labels are supported in reiserfs v3.6 format. (2.4 supopr was merged into
>2.4.19-pre3, if I remember correctly).

Ok, so it looks like I can use the option and if they have the right kernel
code it will just work.

>> Second, what is the option to keep fsck from prompting for 'Yes' when
>> running.  I need to exec this without additional input.  Seems like
quiet
>> should do it, but it doesn't.

>Hans has a decision that this should not be done for now because
>reiserfsprogs are in active bugfixing stage.

Bummer.

>You can circumvient this by echo Yes | reiserfsck ...
>if you need.

Actually this is not trivial in fork/exec in C code.  Especially when I
want to preserve the return code from the fsck.  If you know of a coding
trick to do this I would be interested.

Steve




