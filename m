From: Spam <spam@tnonline.net>
Subject: Re: Need Warm Fuzzies, ReiserFS (3)
Date: Mon, 20 Dec 2004 17:32:38 +0100
Message-ID: <1046303449.20041220173238@tnonline.net>
References: <41C66615.5010206@simutronics.com>
 <200412201331.25180.christian.mayrhuber@gmx.net> <20041220153840.GA11409@zero>
 <200412201725.03216.christian.mayrhuber@gmx.net>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22853-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200412201725.03216.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


  

> On Monday 20 December 2004 16:38, Tom Vier wrote:
>> On Mon, Dec 20, 2004 at 01:31:25PM +0100, Christian Mayrhuber wrote:
>> > The barrier mount option should provide protection against a corrupted
>> > journal during power failure for drives with write caching enabled.
>> > (Mostly IDE)
>> 
>> There's a mount option for write barriers? It should be enabled by default.
>> Otherwise, that's asking for tons of users with corruption. 
> http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.9

> Before disk barriers you had to disable harddisk write caching to prevent
> journal corruption. This is what nearly no one did and blamed the
> filesystems instead.

> Disk barriers are only in since 2.6.9, so maybe these get turned on per
> default after some more testing. That did happen to the data=ordered journal
> mode.

  What happen with the performance when these barriers are active?

  Is it only during power failure the data in the write cache is lost?
  
  Also, does anyone know if the data in the disk write cache is
  written out if the system crashes/freezes. Power failure is not a
  very common occurrence, but crashes are much more so.
  
  Is it possible to detect if filesystem was unmounted due to power
  failure or due to a kernel crash?

  ~S


-- 

