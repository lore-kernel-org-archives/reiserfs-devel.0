From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: 2.6.0-test6 crash while reading files in /proc/fs/reiserfs/sda1
Date: Wed, 1 Oct 2003 19:43:38 +0100
Sender: <viro@www.linux.org.uk>
Message-ID: <20031001184338.GW7665@parcelfarce.linux.theplanet.co.uk>
References: <1064936688.4222.14.camel@localhost.localdomain> <200309302006.32584.vitaly@namesys.com> <1065019441.4226.1.camel@localhost.localdomain> <16251.5348.570797.101912@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15760-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <16251.5348.570797.101912@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Zan Lynx <zlynx@acm.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Wed, Oct 01, 2003 at 09:54:44PM +0400, Nikita Danilov wrote:
 
> Cannot help but describe a little detail: r_stop() erroneously thought
> that de->data contains a pointer to the super block, while in reality
> address of some fs/reiserfs/procfs.c:show_* function was stored
> there. As a result, deactivate_super() danced fine fandango on core, in
> particular, in the case of show_oidmap() it modified first assignment
> within loop to reset loop counter back to zero.

*Ouch*

Thanks for spotting.  IMO there's an easier fix, though - I see what you
do with ERR_PTR() and it's a clever way to pass information, but it would
be much more straightforward to have the following:

r_start() - as now

static void *r_next(struct seq_file *m, void *v, loff_t *pos)
{
	++*pos;
	if (v)
		deactivate_super(v);
	return NULL;
}

static void r_stop(struct seq_file *m, void *v)
{
	if (v)
		deactivate_super(v);
}

r_show() - as now.

We don't need to crawl in de->... guts past that point in ->start() - after
all, past that point we'll have a pointer to our superblock passed as argument.
