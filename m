From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 resize
Date: Thu, 21 Sep 2006 02:48:49 -0500
Message-ID: <451243E1.9050205@slaphack.com>
References: <eeng4b$i68$1@sea.gmane.org> <200609191723.01936.vs@namesys.com>	 <45102ED6.6080209@slaphack.com> <b5d90b2a0609200039g70c40f5bvb374b5f15b42988d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29953-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b5d90b2a0609200039g70c40f5bvb374b5f15b42988d@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alexey Polyakov <alexey.polyakov@gmail.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

Alexey Polyakov wrote:
> On 9/19/06, David Masover <ninja@slaphack.com> wrote:
> 
>> When I have over a
>> gig of RAM free (not even buffer/cache, but _free_), and am trying to
>> download anything over BitTorrent, even if it's less than 200 megs, the
>> disk thrashes so badly that the system is really only usable for web and
>> email.  Even movies will occasionally stall when this is happening, and
>> by "occasionally", I mean every minute or so.
> 
> Do you have this problem on plain vanilla + reiser4?

Yes.

Well, no.  My kernel is:

vanilla 2.6.17.13 on amd64

patches:
sk98lin 8.36, latest from the manufacturer
reiser4-for-2.6.17-3
my own patch that disables fsync and fdatasync

external modules, installed via Portage:
ALSA 1.0.11 driver, using snd_emu10k1 and all sorts of support stuff 
(OSS emulation, synth, etc)
nvidia driver, 1.0.8762

I've also been having a bit of instability issues, but only very rarely 
do these seem at all FS-related.  I'm overclocked a bit, and I can 
reliably crash my system by playing Neverball, Doom 3, or Quake 4 for 
several hours.  I strongly suspect this is either my overclocking or the 
nvidia drivers here.

However, I doubt anything I've done beyond vanilla+reiser4 is affecting 
this disk access issue, and I'm pretty much rock solid when I'm not 
playing a game.  I also have a close-to-identical machine nearby which 
is not overclocked, same kernel, same modules, everything except the 
nvidia driver, been rock solid for a year, no performance issues to 
speak of.  The main difference, other than graphics, is that the stable 
machine is using 21 gigs out of 72, whereas the unstable one (the one 
that's sluggish for BitTorrent) is using 279 gigs out of 350, and has 
been up to 320 or 330 at least before I started cleaning things out.

So I think we're down to two possibilities:  Either an update to Azureus 
has found a way to sync that I'm not aware of, or this is the behavior 
someone described where Reiser4 will attempt to find contiguous space to 
allocate, and continue searching and re-searching the same areas of the 
disk almost every write.  To be honest, I hope it's about syncing, 
somehow, because I'd much rather believe my disk isn't horrendously 
fragmented...
