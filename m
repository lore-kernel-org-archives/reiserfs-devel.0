From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: SUSE 9.1 with ReiserFS:  / won't fsck, but is otherwise fine
Date: Fri, 24 Sep 2004 15:30:52 +0200
Message-ID: <20040924133052.GA1617@hvs.envisage.co.za>
References: <1095996040.10293.18.camel@xserver.local.net> <200409241116.09066.vitaly@namesys.com> <1096032016.17001.4.camel@xserver.local.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21902-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1096032016.17001.4.camel@xserver.local.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Worley <cworley@symbionsys.com>
Cc: reiserfs-list@namesys.com


1) Why do you *want* to fsck a reiserfs? Unless you have troubles, then a
fsck on a reiserfs is not needed by design of a logging/journaling fs
2) any fsck needs to be done on a read-only mounted fs, and then if
anything have been fixed, that fs preferably needs to be umounted (see the
trouble with / already mounted) and mounted again to makesure the caches etc.
is cleared.

Hendrik
