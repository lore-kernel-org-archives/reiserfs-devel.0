From: Oleg Drokin <green@namesys.com>
Subject: Re: To compare Linux journalised filesystem, part II.
Date: Fri, 25 Oct 2002 09:48:04 +0400
Message-ID: <20021025094804.A1197@namesys.com>
References: <3DB823AA.6010405@eprocess.fr>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11770-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DB823AA.6010405@eprocess.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabien Combernous <fcombernous@eprocess.fr>
Cc: ext3-users@redhat.com, jfs-discussion <jfs-discussion@www-124.southbury.usf.ibm.com>, reiserfs <reiserfs-list@namesys.com>, linux-xfs@oss.sgi.com

Hello!

On Thu, Oct 24, 2002 at 06:45:30PM +0200, Fabien Combernous wrote:
> +------------------+-----+------+-----+----------+------------------------------------------------------------------------+
> | NFS              |  Y  |  Y   |  Y  |    Y     | nfs works on all of them. You need at least reiserfs v3.6.

NFS will work with reiserfs v3.5 too, just there is a probability of having 
problems with reusing object ids (and therefore the inode numbers too).
 
> |data journal      |  N  |  Y   |  N  |    N     | Only ext3 can take care of data by a data journal. All other journaled |
> |                  |     |      |     |          | file systems have "only" a metadata journal.                           |

No. Chris Mason have set of patches that implement data journaling for reiserfs,
too.

Bye,
    Oleg
