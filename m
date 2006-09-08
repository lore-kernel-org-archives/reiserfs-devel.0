From: grossnik.mailinglists@hispeed.ch
Subject: Re: Re: reiserfsck (3.6.19) --rebuild-tree failed
Date: Fri, 8 Sep 2006 14:04:43 +0200
Message-ID: <200609081204.k88C4hY5008507@smtp.hispeed.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29834-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
Sender: Grossniklaus Mailinglists <grossnik.mailinglists@hispeed.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vs@namesys.com
Cc: reiserfs-list@namesys.com

Vladimir
>Btw, did reiserfstune say you something like the below?
>
>reiserfstune -B list2 /dev/hda2
>reiserfstune: Bad block 32793 is used already in reiserfs tree. To mark it=
 as=20
>a bad block use reiserfsck
>--fix-fixable with -B option.

Yes. exactly.
Then I did:
reiserfsck --rebuild-tree --badblocks /root/hda3.bad /dev/hda3=20

after 25% the --rebuild-tree stopped saing that there were bad blocks and t=
hat I've to provide the -B option and a badblock file.=20
(I thought that -B and --badblocks were the same?)

I did not use the --fix-fixable option.

So many Thx for you help!

Kind Regards
Bruno


