From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiser4progs do not handle the reiser4 format changes
Date: Sun, 24 Jul 2005 03:44:39 +0400
Message-ID: <42E2D667.6060104@namesys.com>
References: <42DE5A5E.9020404@namesys.com> <42DE9DD6.1090104@slaphack.com> <42DEF3C7.3040104@namesys.com> <42DF5511.1060009@namesys.com> <42DF7A7A.9070308@namesys.com> <42DFDCCA.1000002@slaphack.com> <42E196FB.6080409@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25241-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42E196FB.6080409@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, "E.Gryaznova" <grev@namesys.com>, reiserfs-list@namesys.com

Edward Shishkin wrote:

> David Masover wrote:
>
>>
>>
>> Ok, please explain what this actually means for users.
>>
>> How will an FS made by the current reiser4progs be different than 
>> that made by the new (patched) ones that will be coming out?  Is the 
>> new way better?  If so, how can one take an existing FS and 
>> convert/update/tweak it to the new way?
>>
>
> This is a common scenario:
>
> Each disk reiser4 is supposed to be supported by all kernel/reiser4.


I was wrong here: the only last version of kernel/reiser4 is able
to support _all_ disk file systems. Old kernels will refuse to mount
file systems of new versions with the warning about wrong plugin set
of root inode.

Edward.

>
> Both kernel and reiser4progs have a plugin table which should be 
> upgraded in sync.
> For each point A of upgrading the plugin table all reiser4progs of 
> versions < A
> become invalid for disk reiser4 being once mounted in the 
> kernel/reiser4 of version >= A.
>
> Is it okay?
> Perhaps introducing a special sub-versions of reiser4/reiser4progs for 
> upgrading
> the plugin table will improve the situation..
>
>
> Edward.
>
>>
>>
>
>
>

