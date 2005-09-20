From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 ; regressions in 2.6.14-rc1-mm1
Date: Tue, 20 Sep 2005 14:27:42 -0500
Message-ID: <433062AE.1010405@slaphack.com>
References: <dgpm57$i5s$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <dgpm57$i5s$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: reiserfs-list@namesys.com

Laurent Riffard wrote:

> A) Suspend-to-disk does not work because the process "[ent:hda8]" can't be stopped. 

Strange, this used to work.  Haven't had occasion to try it again 
lately, though.

> B) Can't mount a loop file on reiser4 :

I do this all the time, though not on the mm kernel.  ext3 loop file on 
a reiser4 disk, reiser4 loop file on a reiser4 disk.  Haven't tried 
reiser4 loop file on an ext3 fs.

Can anyone else confirm this?
