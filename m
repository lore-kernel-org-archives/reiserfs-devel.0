From: Yury Umanets <umka@namesys.com>
Subject: Re: non-standard journal breaks autodetect
Date: Mon, 11 Aug 2003 09:14:07 +0400
Message-ID: <1060578846.11863.16.camel@haron.namesys.com>
References: <20030811003226.GA426@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15280-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030811003226.GA426@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

On Mon, 2003-08-11 at 04:32, Tom Vier wrote:
> [root@zero root]# mkreiserfs -l hosts -s 16386 /dev/sdc4
> [root@zero root]# mount /dev/sdc4 /mnt/
> mount: you must specify the filesystem type
> [root@zero root]# mount -t reiserfs /dev/sdc4 /mnt/
> [root@zero root]# 

Hello Tom,

What disto do you use? It seems, that your mount utility (util-linux
package) does not know about non-standard journal in reiserfs, as it
uses own magic string.

Chris Mason (SuSE) has fixed this issue few months ago, but
unfortunately, his patch is not in mainstream yet. So, as a cure for
your problem, you should download SuSE util-linux source rpm and rebuild
it for your system.

Regards.


