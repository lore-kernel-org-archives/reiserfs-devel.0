From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [Jfs-discussion] To compare Linux journalised filesystem, part II.
Date: Thu, 24 Oct 2002 17:54:27 +0100
Sender: linux-xfs-bounce@oss.sgi.com
Message-ID: <20021024175427.A23034@infradead.org>
References: <3DB823AA.6010405@eprocess.fr>
Mime-Version: 1.0
Return-path: <linux-xfs-bounce@oss.sgi.com>
Content-Disposition: inline
In-Reply-To: <3DB823AA.6010405@eprocess.fr>; from fcombernous@eprocess.fr on Thu, Oct 24, 2002 at 06:45:30PM +0200
Errors-to: linux-xfs-bounce@oss.sgi.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabien Combernous <fcombernous@eprocess.fr>
Cc: ext3-users@redhat.com, jfs-discussion <jfs-discussion@www-124.southbury.usf.ibm.com>, reiserfs <reiserfs-list@namesys.com>, linux-xfs@oss.sgi.com

On Thu, Oct 24, 2002 at 06:45:30PM +0200, Fabien Combernous wrote:
> | mmutable         |  N  |  Y   |  Y  |    Y     | "Y" is not with same sens. Implementation is not same. Each one permit |
> | append-only      |     |      |     |          | some elements that other don't permit and reverse. xfs will have       |
> |                  |     |      |     |          | implementation in futur.                                               |

neither jfs or reiserfs support this..

> +------------------+-----+------+-----+----------+------------------------------------------------------------------------+
> | quotas           |  Y  |  Y   |  Y  |    Y     | Again "Y" is not aqual. ext3 accept quota only on data-journaled       |
> |                  |     |      |     |          | filesystems, but all other journaled filesystem don't have data journal|
> |                  |     |      |     |          | About reiserfs you need Chris patches.

jfs doesn't support quotas. 


