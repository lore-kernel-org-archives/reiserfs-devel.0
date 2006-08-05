From: David Masover <ninja@slaphack.com>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed
 by kernelnewbies.org regarding reiser4 inclusion)
Date: Fri, 04 Aug 2006 21:01:15 -0400
Message-ID: <44D3EDDB.4060204@slaphack.com>
References: <200608021845.k72Ij7us009749@laptop13.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29483-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608021845.k72Ij7us009749@laptop13.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, =?UTF-8?B?xYF1a2FzeiBNaWVyenc=?= =?UTF-8?B?YQ==?= <prymitive@pcserwis.hopto.org>, LKML <linux-kernel@vger.kernel.org>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Horst H. von Brand wrote:
> Vladimir V. Saveliev <vs@namesys.com> wrote:
>> On Tue, 2006-08-01 at 17:32 +0200, Åukasz Mierzwa wrote:

>>> What fancy (beside cryptocompress) does reiser4 do now?
>> it is supposed to provide an ability to easy modify filesystem behaviour
>> in various aspects without breaking compatibility.
> 
> If it just modifies /behaviour/ it can't really do much. And what can be
> done here is more the job of the scheduler, not of the filesystem. Keep your
> hands off it!

Say wha?

There's a lot you can do with the _representation_ of the on-disk format 
without changing the _physical_ on-disk format.  As a very simple 
example, a plugin could add a sysfs-like folder with information about 
that particular filesystem.  Yes, I know there are better ways to do 
things, but there are things you can change about behavior without (I 
think) touching the scheduler.

Or am I wrong about the scope of the "scheduler"?

> If it somehow modifies /on disk format/, it (by *definition*) isn't
> compatible. Ditto.

Cryptocompress is compatible with kernels that have a working 
cryptocompress plugin.  Other kernels will notice that they are meant to 
be read by cryptocompress, and (I hope) refuse to read files they won't 
be able to.

Same would be true of any plugin that changes the disk format.

But, the above comments about behavior still hold.  There's a lot you 
can do with plugins without changing the on-disk format.  If you want a 
working example, look to your own favorite filesystems that support 
quotas, xattrs, and acls -- is an on-disk FS format with those enabled 
compatible with a kernel that doesn't support them (has them turned 
off)?  How about ext3, with its journaling -- is the journaling all in 
the scheduler?  But isn't the ext3 disk format compatible with ext2?

>> quota support
>> xattrs and acls
> 
> Without those, it is next to useless anyway.

What is?  The FS?  I use neither on desktop machines, though I'd 
appreciate xattrs for Beagle.

Or are you talking about the plugins?  See above, then.

