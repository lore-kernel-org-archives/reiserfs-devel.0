From: Pierre Abbat <phma@webjockey.net>
Subject: Re: help recover filesystem corrupted by failing ide controller
Date: Sun, 16 Mar 2003 18:48:29 -0500
Message-ID: <200303161848.29929.phma@webjockey.net>
References: <200303141942.00679.phma@webjockey.net> <200303152013.46523.phma@webjockey.net> <200303161833.00381.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13289-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303161833.00381.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>

On Sunday 16 March 2003 10:33, Vitaly Fertman wrote:
> Hi,
>
> > reiserfs_open_journal: journal parameters from super block does not match
> > to journal parameters from journal.
>
> There is a new check for journal parameters were added which helps to
> recover fs with relocated journal and in a few other cases. These
> parameters were not stored correctly in old kernels before relocated
> journal appeared. This is nothing to worry about, and you can fix with fsck
> --rebuild-sb help - say there to fix parameters in the jouranl by ones from
> the super block.

Thanks. I successfully refscked /var and /home and the computer is up and 
running.

phma
-- 
.i toljundi do .ibabo mi'afra tu'a do
.ibabo damba do .ibabo do jinga
