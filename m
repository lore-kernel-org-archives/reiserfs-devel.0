From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions -- oooh!
Date: Fri, 20 Jun 2003 13:42:13 +0200
Message-ID: <3EF2F315.2080306@g-house.de>
References: <3EF07AFB.8060303@g-house.de> <20030618152626.GA17240@namesys.com> <3EF0A8E8.2000209@g-house.de> <20030619054535.GA23852@namesys.com> <3EF20728.2080905@g-house.de>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14639-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EF20728.2080905@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

hi,

after diggin a little more into this, i think we really have some weird 
problem here. as said before, the data on my fs is not _that_ important.
and with 2.5.72 it's some kind of testbed anyway.

as described in the last mail, i get instant corruptions on this 
ReiserFS. furthermore, new created files on this fs *differ* from its 
source:

lila:~# cp -a /lib/ /var/cache/apt-proxy/temp/ | wc -l
     329
lila:~#

(with sde2 mounted on /var/cache/apt-proxy/ (reiserfs).
then i did:

lila:~# diff -r /lib/ /var/cache/apt-proxy/temp/lib/ | wc -l
      62
lila:~#

so 62 differ in an instant! there are probably symlinks in /lib, dunno 
how they get counted with "diff" or "cp". the partition with ReiserFS 
(and ext3 too) are mounted with "noatime" only, no other mount-options used.
(i hate to say that, but the same thing on a ext3 gives no diff's at 
all. after "cp" the files should really be the same)

so, what to do now? the ReiserFS was created as "format 3.6", but some 
time ago, with a 2.4 kernel i think. will it help to test this with 
different kernels, tools, archs? any hints?

for the record: there are still 329 files in /lib, and every time 
exactly 131 corruptions are found.

Thank you,
Christian

