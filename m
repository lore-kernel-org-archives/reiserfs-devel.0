From: Viktors Rotanovs <viktors@rotanovs.com>
Subject: Re: 4.0 stable ?
Date: Mon, 12 Jan 2004 18:12:01 +0200
Message-ID: <4002C751.1010309@rotanovs.com>
References: <1157.192.168.0.97.1073894170.squirrel@sml.dyndns.org>    <16386.26113.665652.955743@laputa.namesys.com>    <400271C8.9070404@rotanovs.com> <1068.192.168.0.97.1073921580.squirrel@sml.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16457-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1068.192.168.0.97.1073921580.squirrel@sml.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Thomas Graham wrote:

 >are you fuly using reiser4 now (using it as root partition ? ) ? gentoo
 >default not supported reiser4, is it stable enought ?

I use it as root, but not as boot. I installed gentoo on reiserfs (v. 
3.6), then compiled new kernel with reiser4 support in it, rebooted, 
created reiser4 partition, copied everything there and added entry for 
it in grub.conf (with corresponding root= flag). One more reboot and 
things are twice as fast (at least copying /usr/src with kernel sources 
is 2x faster on reiser4 than on reiserfs).
I never had a problem with reiser4 except test7 kernel where there were 
slight interactivity problems when copying large sets of files.

 >>Nikita Danilov wrote:
 >>
 >>>Thomas Graham writes:
 >>>
 >>>>when does it stable anyway ?!
 >>>
 >>>It depends on your definition of stable. It is stable for ordinary use,
 >>>and as far as I know people are using it for home directories for some
 >>>time already. It is still possible to crash it under stress test if one
 >>>is inventive enough and has enough time to waste.
 >>>
 >>>
 >>How many bugs were fixed since the last snapshot?
 >>Isn't it time for a new snapshot for 2.6.1 (or 2.6.1-mm)?
 >>I use Reiser4 as for everything on my desktop PC for several months,
 >>without any problems.
 >>(currently 2.6.0 test11, Gentoo linux).
 >>What's the status of compression support?
 >>
 >>>Nikita.


Best Wishes,
Viktors


