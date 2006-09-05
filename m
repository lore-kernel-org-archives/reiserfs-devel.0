From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 corruption on initial copy
Date: Tue, 5 Sep 2006 13:30:54 +0400
Message-ID: <200609051330.54728.vs@namesys.com>
References: <ed9412$2r9$1@sea.gmane.org> <edhdda$3tm$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29810-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <edhdda$3tm$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Peter <sw98234@hotmail.com>

hello

On Monday 04 September 2006 18:32, Peter wrote:
> On Fri, 01 Sep 2006 11:02:58 +0000, Peter wrote:
> > I recently copied over my / partition from a reiserfs to a reiser4
> > partition. This may be user error, but I wanted to report it anyway.
> >
> > Booting off a live cd- I did the following.
>
> snip...
>
> I was able to duplicate the problem. Apparently, the Sabayon live cd does
> not unmount locally mounted partitions. 

That should not be a problem if sync is called after copy is completed.

It looks like Sabayon live cd even does not care to call sync on reboot.

> Thus, the reiser4 partitions are 
> unclean. When I boot up to the newly created and copied partition, I get
> the errors I referred to earlier. By manually umounting the partitions I
> create or copy from -- including /tmp partitions or /var partitions. I do
> not get the boot time errors.
>



