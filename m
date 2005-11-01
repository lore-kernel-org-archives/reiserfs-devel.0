From: Hans Reiser <reiser@namesys.com>
Subject: Re: Trouble with 2.6.13.4-reiser4-4
Date: Mon, 31 Oct 2005 22:46:54 -0800
Message-ID: <43670F5E.9030108@namesys.com>
References: <20051101015551.GA1059@148.Red-217-126-33.pooles.rima-tde.net.>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26750-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051101015551.GA1059@148.Red-217-126-33.pooles.rima-tde.net.>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rvalles <rvalles@es.gnu.org>
Cc: reiserfs-list@namesys.com, vitaly@thebsh.namesys.com

rvalles wrote:

>I've been using reiser4 for a while (since last december). Recently,
>I've upgraded from 2.6.12 to 2.6.13.4 patched with the reiser4 -4 patch
>available on the namesys ftp.
>For some reason, since using this kernel, every now and then the
>filesystem hits the disk really hard for 15 seconds or so blocking IO
>for a program or two (I guess those that triggered the problem) and
>slowing down IO seriously for others. It may be triggered by something
>as easy as pasting some text from firefox to a xterm running vim, and
>the text won't get pasted until the HD hitting ends.
>Just in case, I've booted a recent knoppix and ran the most recent fsck
>(thank you unionfs and apt-get) on the partition. It fixed some little
>stuff extents-related that didn't look serious at all. It didn't fix
>this, tho.
>Maybe it's worth noting that there are no reiser4 related errors or
>warnings, nor IO related, on syslog.
>I can provide more debug-related information on request. I'm looking
>forward for a patch against plain 2.6.14 (not -mm, that breaks stuff I
>need and is by itself far too unstable for my taste) to see if it fixes
>anything, too.
>Cheers.
>  
>
We have a patch coming out any day now that will be a lot more stable
than what is currently the latest.

Vitaly, please label our latest as not very stable in the meantime.

hans

