From: Helge Hielscher <hhielscher@unternehmen.com>
Subject: Re: fsck.reiser4 segfault with one partition
Date: Wed, 02 Jun 2004 22:20:13 +0200
Sender: news <news@sea.gmane.org>
Message-ID: <pan.2004.06.02.20.20.12.597649@unternehmen.com>
References: <pan.2004.06.01.11.57.09.230448@unternehmen.com> <200406021658.17346.vitaly@namesys.com> <pan.2004.06.02.10.19.28.403959@unternehmen.com> <200406022143.08104.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-18984-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed, 02 Jun 2004 21:43:08 +0400, Vitaly Fertman wrote:
> the previous problem was on the semantic pass, but now:
>> Fatal corruptions were found. Semantic pass is skipped.

Aha, but I was running
1st: fsck.reiser4 -> error at semantic pass
2nd: debugfs.reiser4
3rd:  -> got me the second error I posted

> the only write that could happen is the journal replaying. did you umount
> the fs while fscking?

Sure. Just tried the last fsck.reiser4 again using the Gentoo LiveCD.

> which reiser4 code are you using?

latest stable.

> probably you have upgraded to some newer snapshot?

only installed the libaal-0.5.1.tar.gz and reiser4progs-0.5.4.tar.gz after
you have been sugesting to try the latest version first, but I didnt
uninstall the old version beforehand. maybe that was the mistake I made?

Regards,
Helge

