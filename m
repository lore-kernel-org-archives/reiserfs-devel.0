From: Dirk Schenkewitz <Dirk.Schenkewitz@interface-ag.com>
Subject: Re: trolling
Date: Wed, 12 Feb 2003 13:32:07 +0100
Message-ID: <3E4A3EC7.66AD22C8@interface-ag.com>
References: <3E494808.413781E@interface-ag.com> <20030212131120.A10438@t-raenon.nmd.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12711-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: flx@msu.ru
Cc: Reiserfs List <reiserfs-list@namesys.com>

Hello Mr. Lyamin,

Alexander Lyamin schrieb:
> 
> Once, back in 1990, I had one customer calling and blaming me
> that we sold them BAD crt, where only LEFT part of screen being
> not displaying everything. Being upset (CRT's were expensive
> in thouse days) I went to his office only to realise that this
> person used Norton Commander shell and pushed Ctrl+F1 effectively
> turning off left panel....
> 
> He was IGNORANT, but his rage and HATRED were so PURE.

:-) Well, I can understand both viewpoints, I have been on both
sides - right now I must be on a troll's side.

> You see, for IGNORANT people its much easier to blame someone else
> then their ignorance.

I'm aware of my ignorance, really. At least a bit. But, see, in
that case it was not much loss to just forget the filesystem, and
it was EASIER for me to give ext3 a try than to go to someone else 
and search the internet for a solution - I had no internet access
by myself back then.

> P.S. "In addition, check your facts before making a statement that
> insults someone and claims something that is completely untrue."
>
> Powersupply units physically damaging hard-drive disks (plates!).

Well, I'm not sure what EXACTLY happened. Somehow I got suspicious
about the power supply, put in a new one, and from there on, every-
thing was fine. Then I checked the disk, a few tracks seemed to be
damaged, they turned out to be unrelieable. I modified the partitions
so that these tracks were left out. (The disk ist still in use today.)
Again, I'm not sure, but I believed the bad power made the disk slow
down or have the head land or something else while working in that
area. I believed that the journal area was the one which got most of
the traffic, so I thought it was logical that it got most of the
damage. The same was true for the ext3-journal area - both journals
got corrupted.

> Unwillingness of running FSCK when its known that filesystem was 
> physically corrupted.

I was not really unwilling - I was too stupid to find one on my
system and on my CDs. :-/

> EXT2 never runned fsck in YEARS (what about mountcount flag? :).

Er... did I say that? Sorry, that's wrong. In fact, fsck.ext3 ran
every time the system was bootet, but normally it only replays the
journal (if needed), unless the actual number of mounts exceed the
max-mounts, as you say. Admittedly, it is a pain to wait several
minutes to let that finish. I tuned my system (by adjusting the
max-mountcount values and the mountcount values) so that no more
than one partition is "really" fsck'd per boot. (*Sigh*)

That's one reason why I'm here!

Thanks for answering a troll :-) - happy coding
	dirk
-- 
Dirk Schenkewitz 

InterFace AG                 fon: +49 (0)89 / 610 49 - 126
Leipziger Str. 16            fax: +49 (0)89 / 610 49 - 83
D-82008 Unterhaching         
http://www.interface-ag.de   mailto:dirk.schenkewitz@interface-ag.de
