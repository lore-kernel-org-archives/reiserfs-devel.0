From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: reiserfsck --rebuild-tree bug (loops forever)
Date: Fri, 21 Mar 2003 10:37:09 +0100
Message-ID: <20030321103709.6c52f46d.philippe.gramoulle@mmania.com>
References: <1048239084.9237.9.camel@dawn.clansoft.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13313-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1048239084.9237.9.camel@dawn.clansoft.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi,

3.6.4 is not the latest reiserfsck version.

3.6.5 [1] is the latest and several bugs have been fixed since.

Could you please retry with reiserfsck 3.6.5 ?

Thanks,

Philippe

[1] Reiserfprogs : ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.5.tar.gz


On 21 Mar 2003 10:31:24 +0100
Baldur Norddahl <bbn@clansoft.dk> wrote:

  | dawn:~# reiserfsck -V
  |  <--------reiserfsck 3.6.4, 2002-------->
