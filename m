From: Herbie Hopkins <Herbie@Hopkins.net>
Subject: slow mount
Date: 12 Jun 2003 15:20:29 +0100
Message-ID: <1055427629.1875.8.camel@terminus.zapto.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14515-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

It seems to take a very long time to mount a large reiserfs filesystem:

  $ time mount /home
 
  real    0m17.259s
  user    0m0.000s
  sys     0m0.000s

  $ df -h

  Filesystem            Size  Used Avail Use% Mounted on
  [snip]
  /dev/hda7              44G   12G   33G  26% /home

is this normal behaviour? as this drastically increases my system statup
time. The same partition formatted to ext3 mounts in less than a second
and this also seems to have no reflection on the amount of data on the
partition as it still takes this long when the filesystem in empty.

Any help would be appretiated, thanks.
Herbie

