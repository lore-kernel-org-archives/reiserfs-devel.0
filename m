From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: reiserfs--panik
Date: Mon, 27 Oct 2003 16:58:39 +0100
Message-ID: <3F9D40AF.5020702@gmx.net>
References: <3F9D3CB6.3030104@t-online.de>
Reply-To: ReiserFS List <reiserfs-list@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15898-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F9D3CB6.3030104@t-online.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J. Paul Grube" <altaa@t-online.de>
Cc: reiserfs-list@namesys.com

J. Paul Grube wrote:
> this is what i get...
> Linux version 2.4.20-4GB-athlon (root@Athlon.suse.de) (gcc version 3.3
> 20030226 (prerelease) (SuSE Linux)) #1 Wed Aug 6 18:27:52 UTC 2003
> 
> linux:/ # reiserfsck --rebuild-tree --scan-whole-partition /dev/md0
> reiserfsck 3.6.4 (2002 www.namesys.com)

Please download newer reiserfsprogs from
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.11.tar.gz
and check if the problem is still there.
No  -> good for you
Yes -> does it happen always at the same block?
       Yes -> it's probably faulty reiserfsprogs
       No  -> it's probably faulty hardware


Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/

