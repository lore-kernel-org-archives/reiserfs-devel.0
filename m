From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions (sorry)
Date: Sat, 28 Jun 2003 02:24:18 +0200
Message-ID: <3EFCE032.1050103@g-house.de>
References: <3EF9E939.1050501@g-house.de> <20030626092608.GA12252@namesys.com> <3EFAE933.6040206@g-house.de> <20030627092821.GA29715@namesys.com> <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de> <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com> <3EFC9919.8020308@g-house.de> <20030627211416.GA16091@namesys.com> <3EFCC72F.9020100@g-house.de> <3EFCCCEC.9090603@g-house.de>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14766-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EFCCCEC.9090603@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

sorry,

my last mail was sent 3 times, i'll blame mozilla this time.

and: i won't stop coming up with odd phenomenas regarding this issue.
while playing around with mkreiserfs/cp/diff i have to say that i 
sometimes copy files with "mc", a curses based file-manager (Midnight 
Commander, much like NortonCommander, i think it's very a common tool).

then, when copying files with this mc i do _not_ get corruptions on the 
fs. yes, it's reproduceable. no differences are shown (diff) and 
reiserfsck shows no corruptions. i can copy the whole /var/lib to this 
fs (which fills it up to 80% or so) with "mc" - no corruptions.
i copy 7MB (35 files) of textfiles to the fs (always after a fresh 
mkreiserfs) with "cp" and i get differences (*) and corruptions reported 
by reiserfsck.

this is odd, i don't know how "mc" copies files internally, it's perhaps 
not that important, but i wanted to share these results, just in case 
you/sbd. else wants to reproduce corruptions and cannot...

Thanks,
Christian.

(*) here: 2 files out of 35 differ when using "cp".

lila:~# cp --version
cp (coreutils) 5.0

lila:~# mc -V
GNU Midnight Commander 4.6.0
Virtual File System: tarfs, extfs, cpiofs, ftpfs, fish
With builtin Editor
Using included S-Lang library with terminfo database
With subshell support as default
With support for background operations
With mouse support on xterm and Linux console
With internationalization support

