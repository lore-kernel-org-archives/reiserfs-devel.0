From: "David Masover" <ninja@slaphack.com>
Subject: Re: praise the reiser4 developers!
Date: Sat, 10 Apr 2004 13:04:25 -0500 (CDT)
Message-ID: <21379.208.32.105.18.1081620265.squirrel@slaphack.com>
References: <1081542563.14002.1.camel@redeeman.linux.dk>
    <40778EAE.2090907@namesys.com>
Reply-To: ninja@slaphack.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-17834-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40778EAE.2090907@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Hans Reiser said:
> Redeeman wrote:
>
>>i must say! you own!
quite so.

>>normally when i sync my portage, the disk noises and it takes ages. with
>>reiser4 it takes no time, and the disk doesent noise at all. also, now
>>it is my connection (50kb/s) that limits the speed

On 768k dsl, I do notice that syncing portage does take less time.  The
disk does spin, but it doesn't thrash -- the light stays on, but no noise.

I haven't tried XFS, which seems like the only runner-up, but scares me
with how many things it patches, and isn't quite as sexy with plugins.

> thanks so kindly.  I think reiser4 is probably especially effective for
> laptops.

It is, in theory.  In practice, I think something other than reiser4 is
preventing my disk from spinning down.

It's been months since I've tried a snapshot, though, as my laptop is dead
and at the manufacturer for service.  This was a hardware problem, as the
screen is still dead even in BIOS, and reiser4 still worked when I hooked
up to a CRT.  When it worked, though, the speed boost was pretty
incredible.

One thing I hope happens sometime -- I notice that Linux doesn't swap
until it needs to.  This means that if I have 512 megs of RAM, and 128 or
so is used by GNOME and such, and I let it idle, then that 128 megs never
gets swapped out.  It would be helpful if it did -- if RAM was treated
just like a cache, so that least-frequently-used things get swapped out /
flushed to disk / purged from the disk cache, while more frequently used
things stay, probably with a slant towards more recently used things.

I'm sure there could be more thought put into the actual implementation
and algorithm used.  Linux does do this nice thing of using all available
RAM for something, the only problem is, some of the RAM that it "uses" is
wasted because it is used so infrequently.

Ultimately, this is geared towards letting my laptop drive spin down for
longer.  I use GNOME on it to show off to people who thing Linux is not
user-friendly, or is "a copy of Windows", but it only has 256 megs of ram,
which doesn't leave nearly enough for reiser4's ramdisk-like operations
(temporary changes to temporary files that should never touch disk).

Normally, I sign all my emails, but I keep my PGP key on two machines
only, and don't trust it to the webmail server.  If anyone cares, let me
know, and I'll re-send a signed copy of this email.
