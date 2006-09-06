From: Hans Reiser <reiser@namesys.com>
Subject: Re: FEATURE Req: integrate badblocks check into fsck.reiser*
Date: Tue, 05 Sep 2006 17:53:24 -0700
Message-ID: <44FE1C04.70800@namesys.com>
References: <ed9tqo$2tc$1@sea.gmane.org> <200609012250.44548.vs@namesys.com>	<44F8B3C8.1050802@slaphack.com> <edae71$iqf$1@sea.gmane.org> <44F8BE78.1080503@slaphack.com> <44FB925E.2000300@emc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29816-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44FB925E.2000300@emc.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ric Wheeler <ric@emc.com>
Cc: David Masover <ninja@slaphack.com>, Peter <sw98234@hotmail.com>, reiserfs-list@namesys.com

Ric Wheeler wrote:
>
>
> David Masover wrote:
>
>> Peter wrote:
>>
>>> On Fri, 01 Sep 2006 17:27:20 -0500, David Masover wrote:
>>> snip...
>>>
>>>>> both mkfs.reiserfs and fsck.reiserfs have -B option to accept list of
>>>>> bad blocks. We thought that should be enough.
>>>>
>>>> It really should.  Why bother with a patch?  Just write a wrapper
>>>> script
>>>> that runs badblocks and passes in the list to mkfs.
>>>
>>>
>>> It was just a thought from userland. My perspective was that a user,
>>> not a
>>> hard-boiled geek, might get lulled into a false sense of security
>>> but may
>>> not have the wherewithal to write a wrapper. If nothing else, when the
>>> final doc is written (did I say final?:)), it should include a notice
>>> about not running badblocks.
>>
>>
>> Well, let's see...  Most hard drives come more thoroughly tested at
>> the factory than anything badblocks would do.  Also, it seems
>> redundant to have every single mkfs have to implement a badblocks flag..
>>
>> I'd suggest a universal wrapper, then, or a modification to the
>> "mkfs" frontend, so that this works the same way across all
>> filesystems. Something like "mkfs -B -t reiser4"
>
>
> I don't think that modern drives that fail writes are worth using for
> a brand new file system.
>
> While failing reads is quite common and can be caused by temporal
> issues (dirt on the platter, a bad write, etc), failed writes are
> almost always a sign that you have a serious issue.  Almost all modern
> drives remap each failed write to a bad sector automatically.  This
> action only fails if you have exhausted this remapping area (or have
> some really nasty issue like a bad cable, bad write head, etc).
>
> Having mkfs ignore bad writes would seem to encourage users to create
> a new file system on a disk that is known to be bad & most likely not
> going to function well.  If a user ever has a golden opportunity to
> toss a drive in the trash, it is when they notice mkfs fails ;-)  This
> option to mkfs sounds like an invitation to disaster.
Yes, you are right, the option should be to run badblocks and then fail
if it finds any.
>
> The other tools (debugreiserfs, reiserfsck, etc) do need to be able to
> handle bad blocks as well as possible since they are often needed
> during a salvage operation. in order to recover data (which might need
> to be migrated to a new disk). It is not clear to me that passing a
> list of bad blocks helps them as much as a robust general purpose
> error recovery support.
>
>
>
>
>
>
>
>

