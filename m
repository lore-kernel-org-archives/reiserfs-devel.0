From: Kevin <coggy@redefine.org>
Subject: Re: access beyond end of device again
Date: Tue, 25 Jun 2002 06:08:21 +0000 (UTC)
Message-ID: <1141375583133.20020626230935@redefine.org>
References: <Pine.LNX.4.44.0206250044360.28871-100000@avon.timetraveller.org>
 <661330051733.20020624103045@redefine.org> <20020625095409.A6209@namesys.com>
Reply-To: Kevin <coggy@redefine.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020625095409.A6209@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


> Reformatted as in mkreiserfs?

Correct.  That's the only change I've made to it though.  Would
rebuilding the superblocks help?  Last time it happened, I rebuilt the
tree, and it deleted the files that I had trouble with.  So it's hard
to say if it really fixed it, or if it was just waiting for me to
write to that spot again.  I'm about to run the Maxtor diags on the
drive and do a factory recertification, just to make sure.

