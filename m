From: Redeeman <redeeman@metanurb.dk>
Subject: Re: reiser4 for windows
Date: Tue, 07 Dec 2004 09:29:22 +0100
Message-ID: <1102408162.12503.25.camel@localhost>
References: <20041207060730.GA1344@zg.cz>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22701-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041207060730.GA1344@zg.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

On Mon, 2004-12-06 at 22:07 -0800, Jiri Klouda wrote:
> > Also, is it a given that reiser4 for windows would work without help
> > from MS?  I've just never seen a third-party filesystem driver for
> > windows.  You'd think that at least one other filesystem, one of the
> > Linux/BSD/etc ones, would have done this, if it was feasable.
> 
> You might be onto something here. I am pretty sure my company would
> pay quite a lot for a working, fast and elegant implementation of 
> symbolic links on windows. Either as a new filesystem or as an addition 
> onto ntfs. We currently use one such addition and not very usable and
> uses a catalog of symlinks that can easily get corrupted.
> 
> Having reiser4 on Windows or even ext2, would be a huge thing.
a real implementation of ext2 for windows exists.. i had it once in
vmware.. but i cant remember the name
> 
> > All this leaves me with the distinct impression that it'd be cheaper to
> > buy some gigabit ethernet (or fibre) and a Linux CIFS/Samba fileserver
> > using reiser4.  Steam and others refuse to install on network drives,
> > Windows probably will not boot off a network drive, but I imagine that
> > fixing these would be easier than porting a filesystem.
> 
> Unfortunatelly even with very fast ethernet connections and network
> appliance with CIFS access, we still don't get the performance of a
> local filesystem. Plus, you don't want to really give write access 
> over network, that slows down anything when you get into hundreds of
> clients. And we really cannot pay for so many network applicances to
> make this scalable proposition.
> 
> I wish we could just drop Windows as a platform, but as long as there
> are customers, there will be need to support them as well... :(
> 
> -Jiri
> 
-- 
Redeeman <redeeman@metanurb.dk>

