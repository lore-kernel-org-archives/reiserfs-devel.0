From: Oleg Drokin <green@namesys.com>
Subject: Re: Mount fails after reiserfsck --rebuild-tree failure
Date: Fri, 20 Jun 2003 16:34:50 +0400
Message-ID: <20030620123450.GB24875@namesys.com>
References: <FCEDLNJPOJKGBCPDLKPGGEFMCBAA.g_luppi@brokerstudio.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14641-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <FCEDLNJPOJKGBCPDLKPGGEFMCBAA.g_luppi@brokerstudio.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ing. Davide Imbeni" <davide.imbeni@tei.ericsson.se>, davide.imbeni@tiscali.it
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jun 19, 2003 at 09:11:29PM +0200, Giuliano Luppi wrote:

> Now I know the problems are (a lot of) bad blocks.
> I would like to
> 1.	re-enable mounting the partition, in order to recover some of the data I
> still have there (I know, I should backup more often? :-( )

This is not possible to "reenable" it.

> 2.	possibly fix the badblocks (as you describe in section 38 of the FAQ), in
> order to bring up the system until new hard disks are ready.

This is not possible in your case, I'd say.
What you can do - is you can copy entire block device to a file/another device
and run rebuild-tree there. Use dd_rescue for copying.

> The main question is: how can I undo the setting of root inode to 0?

There is no such way, if you do not know what was the location of root node.

> Is there a good way for dealing with faulty hardware with reiserfs?

There is no good (reliable) way of dealing with faulty hardware with software, except avoiding
faulty hardware at all costs, I believe.

Bye,
    Oleg
