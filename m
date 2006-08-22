From: David Masover <ninja@slaphack.com>
Subject: Re: problem with reiser3
Date: Tue, 22 Aug 2006 10:35:58 -0500
Message-ID: <44EB245E.50706@slaphack.com>
References: <20060821222421.GC14067@grulic.org.ar> <44EA4400.6090501@namesys.com> <20060821235338.GE14067@grulic.org.ar> <44EA5C92.4010801@slaphack.com> <20060822050656.GG14067@grulic.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29658-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060822050656.GG14067@grulic.org.ar>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcos Dione <mdione@grulic.org.ar>
Cc: Edward Shishkin <edward@namesys.com>, reiserfs-list@namesys.com

Marcos Dione wrote:
> On Mon, Aug 21, 2006 at 08:23:30PM -0500, David Masover wrote:
>>>> it would be better to create a backup on a spare bigger partition
>>>> using dd_rescue (pad not recoverable zones with zeroes), then run
>>>> fsck on the created image.
>>>    unluckly I can't. it's a 160 GiB partition and I don't have spare
>>> space.
>> How much spare space do you have?  You may be able to do some tricks 
>> with dm_snapshot...
> 
>     right now, I have 45 MiB of space in my spare disk. I *could*
> (should?) make more space, but can't guarrantee anythung.

That won't be enough.  Worst case, decide whether the data on that 160 
gig partition is worth buying a cheap 200 or 300 gig drive for this backup.
