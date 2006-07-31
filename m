From: David Lang <dlang@digitalinsight.com>
Subject: Re: the " 'official' point of view" expressed by  kernelnewbies.orgregarding
 reiser4 inclusion
Date: Mon, 31 Jul 2006 13:53:09 -0700 (PDT)
Message-ID: <Pine.LNX.4.63.0607311348150.14631@qynat.qvtvafvgr.pbz>
References: <200607241806.k6OI6uWY006324@laptop13.inf.utfsm.cl> 
 <20060731125846.aafa9c7c.reiser4@blinkenlights.ch>  <20060731144736.GA1389@merlin.emma.line.org>
  <20060731175958.1626513b.reiser4@blinkenlights.ch>  <20060731162224.GJ31121@lug-owl.de>
  <Pine.LNX.4.64.0607311842120.13492@nedra.edsons.demon.nl> 
 <20060731173239.GO31121@lug-owl.de>  <20060731181120.GA9667@merlin.emma.line.org>
  <20060731184314.GQ31121@lug-owl.de>  <20060731191712.GE17206@HAL_5000D.tc.ph.cox.net>
  <20060731192902.GS31121@lug-owl.de> <44CE6153.7090704@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29327-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44CE6153.7090704@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Clay Barnes <clay.barnes@gmail.com>, Rudy Zijlstra <rudy@edsons.demon.nl>, Adrian Ulrich <reiser4@blinkenlights.ch>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Mon, 31 Jul 2006, David Masover wrote:

> Probably.  By the time a few KB of metadata are corrupted, I'm reaching for 
> my backup.  I don't care what filesystem it is or how easy it is to edit the 
> on-disk structures.
>
> This isn't to say that having robust on-disk structures isn't a good thing. 
> I have no idea how Reiser4 will hold up either way.  But ultimately, what you 
> want is the journaling (so power failure / crashes still leave you in an OK 
> state), backups (so when blocks go bad, you don't care), and performance (so 
> you can spend less money on hardware and more money on backup hardware).

please read the discussion that took place at the filesystem summit a couple 
weeks ago (available on lwn.net)

one of the things that they pointed out there is that as disks get larger the 
ratio of bad spots per Gig of storage is remaining about the same. As is the 
rate of failures per Gig of storage.

As a result of this the idea of only running on perfect disks that never have 
any failures is becomeing significantly less realistic, instead you need to take 
measures to survive in the face of minor corruption (including robust 
filesystems, raid, etc)

David Lang
