From: Ingo Bormuth <ibormuth@efil.de>
Subject: Re: some testing questions
Date: Tue, 15 Aug 2006 16:21:40 +0200
Message-ID: <20060815142140.GA4247@kruemel>
References: <44DCC20C.7020400@email.si> <200608141615.58185.vs@namesys.com>
Reply-To: Ingo Bormuth <ibormuth@efil.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29598-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200608141615.58185.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On 2006-08-14 16:15, Vladimir V. Saveliev wrote:
> reiser4progs incluses a program measurefs.reiser4. It should be able to 
> measure tree fragmentation. I am not sure how does portage tree evolve, but 
> maybe it could be interesting too see how does reiser4 tree fragmentation 
> change when filesystem is loaded regularly.

This is a reiser4 partition holding the following:

  - portage tree (synced every three days)
  - ccache (compiler cache allowed to grow to 3GB - recently cleared)
  - firefox's and opera's cache
  - /tmp (portage builds everything in here)

The filesystem was created around 1.5 years ago (how can I say).

#cat /proc/version
Linux version 2.6.17.8-reiser4-r3 (root@kruemel) (gcc version 3.4.6 (Gentoo 3.4.6-r1, ssp-3.4.5-1.0, pie-8.7.9)) #2 Sat Aug 12 12:03:25 CEST 2006

#df:
/dev/hda8              6357768   3478716   2879052  55% /cache

#cat /etc/fstab:
/dev/hda8  /cache  reiser4  noatime,nodiratime,nodev,nosuid,tmgr.atom_max_age=500000  0 0

#measurefs.reiser4 -S:
measurefs.reiser4 1.0.5
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

Tree statistics ... done
Packing statistics:
  Formatted nodes:    3622.85b (88.45%)
  Branch nodes:       2792.00b (68.16%)
  Twig nodes:         3233.75b (78.95%)
  Leaf nodes:         3966.47b (96.84%)

Node statistics:
  Total nodes:         871653
  Formatted nodes:      75571
  Unformatted nodes:   796082
  Branch nodes:            23
  Twig nodes:            1360
  Leaf nodes:          870270

Item statistics:
  Total items:         542211
  Nodeptr items:        75570
  Statdata items:     214695
  Direntry items:       37432
  Tail items:          207819
  Extent items:          6695


Tree fragmentation: 0.074648

Data fragmentation: 0.039962

Last week I recompiled gcc and afterwards cleared 3GB of ccache data. 
Before doing so, the partition was >90% full. My feeling is that now 
that it's half empty performance is much better. Emerge sync used to 
take _ages_ rebuilding its cache and now is quite fast. Also CPU usage 
during compilation seems much lower. I can't remember to ever hear the 
CPU fan running during recent compilations (700MHZ PIII). Before clearing 
the cache it ran continuously and still felt hot.

I know none of this is hard data. If you are interested in a follow up,
just let me know.


BTW: Is it save to run measurefs.reiser4 -S -T -D on a mounted fs ?

-- 
Ingo Bormuth, voicebox & telefax: +49-12125-10226517       '(~o-o~)'
public key 86326EC9, http://ibormuth.efil.de/contact   --ooO--(.)--Ooo--

