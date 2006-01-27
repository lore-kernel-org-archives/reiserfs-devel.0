From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: vs-4080
Date: Fri, 27 Jan 2006 16:32:30 +0200
Message-ID: <200601271632.31266.rmeijer@internet.gr>
References: <200601111109.09437.rmeijer@internet.gr> <43D5B075.1030307@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27901-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43D5B075.1030307@suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tue 24 Jan 2006 6:43, Jeffrey Mahoney wrote:

Hi Jeff,

> > ReiserFS: dm-8: warning: vs-4080: reiserfs_free_block: free_block
> > (dm-8:46707368)[dev:blocknr]: bit already cleared

> What kernel version are you using for this node? I've been developing
> the on-demand bitmap patches and have been getting one of these under
> heavy sustained load. I've assumed that it was a result of my patches,
> but I'm curious what kernel you're running.
>
> Are you running a -mm kernel, stock, or vendor? Which version?

I'm running 2.6.15-cks1 on this machine.


Thanks,

Ray
