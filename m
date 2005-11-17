From: Ingo Bormuth <ibormuth@efil.de>
Subject: Re: More Slowdown
Date: Thu, 17 Nov 2005 09:56:44 +0100
Message-ID: <20051117085644.GA23183@kruemel>
References: <200511111359.39715.jgilmore@glycou.com> <200511120906.39109.jgilmore@glycou.com> <1131997263.10816.56.camel@teratron.lan.etheus.net> <200511142147.07787.chrivers@iversen-net.dk> <1132064829.8002.9.camel@teratron.lan.etheus.net> <b14e81f00511161908k30ed471esbc12b284842b8078@mail.gmail.com>
Reply-To: Ingo Bormuth <ibormuth@efil.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26972-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <b14e81f00511161908k30ed471esbc12b284842b8078@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: ingo@bormuth.org


If you are frequently hit by fsync (as some of the previosly posters told us) 
an option might be to say something as

  tmgr.atom_max_age=30     (or tmgr.atom_max_size=?)

in fstab (or remount the drive in vulnerable situations).

Of course that sacrifices large parts of reiser4's mean performance, but that
might be better than a largely unusable machine. One day reiser4 will be
fully optimized.




On 2005-11-16 22:08, michael chang wrote:
> That would explain any
> jerkiness -- it's because Reiser4 is writing everything from the last
> real write to the actual disk to now (the current real right) in one
> go, and making everything wait. 


-- 
Ingo Bormuth, voicebox & telefax: +49-12125-10226517          '(~o-o~)'
public key 86326EC9, http://ibormuth.efil.de/contact     ---ooO--(.)--Ooo---

