From: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 20:14:05 +0200
Message-ID: <20030806201405.A1357@bitwizard.nl>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com> <20030806192227.B31496@bitwizard.nl> <200308062201.15385.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15191-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200308062201.15385.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Wed, Aug 06, 2003 at 10:01:15PM +0400, Vitaly Fertman wrote:
> Hi Rogier,
> 
> > Well, I forgot to say this in my last Email: but it's a big mistake
> > for "--rebuild-tree" to START by writing to the filesystem. As for a
> > large (and full) filesystem it is going to take HOURS to read the
> > whole thing, the first write to the filesystem should happen AFTER
> > reading all the datablocks.
> 
> Pass0 does not just read blocks and gather information, it fixes leaves 
> of the internal reiserfs tree (storage tree), although it does not change
> the internal tree itself and upper nodes. As it is run after --check which
> has reported that there are fatal corruptions on the fs and rebuild-tree 
> is needed, it is supposed that mounting of that fs may lead to other 
> corruptions. So fs becomes notmountable and rebuild-tree must run 
> to complition.

You can verify on 

	http://www.bitwizard.nl/io_throughput.gif

that (almost) no data was written throughout the first pass.

You can do something like:

#define write my_write
#define llseek my_llseek

before the pass0 code, and do:

static long long cur_pos;
static write_chain_s *write_chain; 

my_llseek (...)
{
  cur_pos = ... ; 
}

my_write (fd, buf, size)
{
  struct write_chain_s *t; 

  t = malloc (sizeof (write_chain_s)); 
  t->data= malloc (size); 
  memcpy (t->data, buf, size)
  t->pos = cur_pos; 
  cur_pos += size; 
  t->next = write_chain; 
  write_chain = t;
} 

Add a flush_postponed_writes to the end of pass0. 

Add some checks that you don't do this using up too much
memory. etc. etc.

				Roger. 

-- 
+-- Rogier Wolff -- www.harddisk-recovery.nl -- 0800 220 20 20 --
| Files foetsie, bestanden kwijt, alle data weg?!
| Blijf kalm en neem contact op met Harddisk-recovery.nl!
