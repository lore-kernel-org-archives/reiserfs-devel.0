From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: A couple of questions
Date: Thu, 16 May 2002 13:44:16 -0500
Message-ID: <OF4AF5C20B.BE2F7D18-ON85256BBB.006643F3@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10343-reiserfs=m.gmane.org@namesys.com>
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

>On Thu, May 16, 2002 at 10:11:37AM -0500, Steve Pratt wrote:
>> >> superblock. Neither 3.5 nor 3.6 superblock appear to have a label
field,
>> >> but mkfs has an option for it.
>> >Labels are supported in reiserfs v3.6 format. (2.4 supopr was merged
into
>> >2.4.19-pre3, if I remember correctly).
>> Ok, so it looks like I can use the option and if they have the right
kernel
>> code it will just work.

>In fact even kernel without "support" will work.
>Support is only means that the space in superblock is marked as used by
>label/uuid instead of being marked as "reserved".
>You cannot query uuid/label from withing the kernel, anyway.

Ok. This is fine.

>> >You can circumvient this by echo Yes | reiserfsck ...
>> >if you need.
>> Actually this is not trivial in fork/exec in C code.  Especially when I

>I think it is.

>> want to preserve the return code from the fsck.  If you know of a coding
>> trick to do this I would be interested.

(pseudocode removed) ...

Thanks! I have this working now.

One extra question on this.  I assume that if in Fix mode and errors are
encountered that fsck.resiserfs will prompt to fix each error and that
there is no way to have it answer 'Yes' automatically like the ext2 -y
option.

If not then I will probably have to take Jonathan Briggs suggestion of a
third process to answer 'Yes' repeatedly.

Steve




