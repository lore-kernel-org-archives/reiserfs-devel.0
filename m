From: Philipp Morger <philipp.morger@dolphins.ch>
Subject: Re: ReiserFSchk "Should not happen."
Date: Mon, 23 Jun 2003 22:05:27 +0200
Message-ID: <20030623200527.GA22164@atlantis.dolphins.ch>
References: <20030623180547.GA25393@atlantis.dolphins.ch> <200306232330.49898.vitaly@namesys.com>
Reply-To: Philipp Morger <philipp.morger@dolphins.ch>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200306232330.49898.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Hi Vitaly

That worked.... but it was a mess afterwards.... only one directory was
left called lost+found... anything else was gone... inside the directory
only numbers.... I could fidle out most of the directories... but the
"/bin" was not restored as directory, the whole content of /bin was
there as binaries... without names only numbers... so far so good.

Thanks
Philipp

On Mon, Jun 23, 2003 at 23:30:49 +0400, Vitaly Fertman wrote:
> 
> Hi,
> 
> > do_pass_2: The block (2184831) is in the tree already. Should not happen.
> > do_pass_2: The block (2184831) is in the tree already. Should not happen.
> > do_pass_2: The block (2184831) is in the tree already. Should not happen.
> > do_pass_2: The block (2184831) is in the tree already. Should not happen.
> > --- 2,6GB of log truncated --
> 
> We experienced that with 3.6.4 reiserfsprogs package from Debian as they 
> applied some faulty patch to it. Would you try reiserfsprogs-3.6.8 from our 
> ftp site and email me about the result?
> 
> -- 
> Thanks,
> Vitaly Fertman
> 
