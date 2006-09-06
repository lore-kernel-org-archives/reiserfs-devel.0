From: David Masover <ninja@slaphack.com>
Subject: Re: FEATURE Req: integrate badblocks check into fsck.reiser*
Date: Wed, 06 Sep 2006 10:08:11 -0500
Message-ID: <44FEE45B.4060607@slaphack.com>
References: <ed9tqo$2tc$1@sea.gmane.org> <200609012250.44548.vs@namesys.com>	<44F8B3C8.1050802@slaphack.com> <edae71$iqf$1@sea.gmane.org> <44F8BE78.1080503@slaphack.com> <44FB925E.2000300@emc.com> <44FE1C04.70800@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29820-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44FE1C04.70800@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Ric Wheeler <ric@emc.com>, Peter <sw98234@hotmail.com>, reiserfs-list@namesys.com

Hans Reiser wrote:
> Ric Wheeler wrote:

>> Having mkfs ignore bad writes would seem to encourage users to create
>> a new file system on a disk that is known to be bad & most likely not
>> going to function well.  If a user ever has a golden opportunity to
>> toss a drive in the trash, it is when they notice mkfs fails ;-)  This
>> option to mkfs sounds like an invitation to disaster.
> Yes, you are right, the option should be to run badblocks and then fail
> if it finds any.

Unless it creates significantly more work for us, there should be an 
option to run badblocks, and if it finds any, it should prompt the user 
(with BIG FAT CAPSLOCK WARNINGS) whether they want to format anyway. 
Formatting anyway should work, and we should be able to have blocks 
marked bad.

It would also be nice to be able to change this later -- to pass in a 
list of badblocks to, say, fsck (which I think is the original request). 
  This is especially nice for recovery, if you don't have the luxury of 
copying a whole disk image to another drive before running fsck.

That's not to say that we should automatically detect and relocate bad 
blocks during normal operation (while the FS is mounted), but 
deliberately removing functionality to protect you from yourself isn't 
the Linux Way.  Linux has a long history of kernel config options that 
say things like "YOU WILL LOSE DATA. You have been warned."
