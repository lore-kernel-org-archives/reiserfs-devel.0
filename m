From: Dirk Schenkewitz <Dirk.Schenkewitz@interface-ag.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 21:57:20 +0100
Message-ID: <3E4AB530.A11BB7D5@interface-ag.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12735-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs List <reiserfs-list@namesys.com>


Oleg Drokin wrote (in response to Anders Widman):

> > > So it would be possible to do some actions to 
> > > 1) get some blocks back in the described way, 
> > > 1.1) write to really bad blocks should have remaped them 
> > >      already here if there is a space in remap area 
> > > 2) save bad blocks to badblock list in fs if they are still bad -
> > >    out of remap area. 
> > > Would be not bad to try to recover in this way already remapped 
> > > blocks - do not know how to get the list of them only.
> > > Ok, but what if the IO error you got is not a bad block, but 
> > > a bad cable? Do you want the fs to work in the described way? 
> > > Trying to fix all automatically? I am not sure.
> >
> >   How about trial and (then) error? :)
> 
> That might be suitable for fsck, but not for kernel I am sure.
> Kernel should just probably return error or try to use different 
> block (if it was doing write) and if certain number of attempts
> failed, return error too.
> Also remount R/O if write error is in system area (journal, 
> superblock, bitmaps) or special mount option was given that demands 
> remounting R/O on io errors.

I still feel that the system area should be DESIGNED to be extra-
robust against everything, because it is vital for the whole fs.
Btw, might such thoughts be the reason that ext2 has superblock
backups? I agree that a bad block in the system area is a good
reason for all kinds of alarm, but a really good fs should overcome
more than one without (unrecoverable) damage to the fs in whole.

happy coding
	dirk
-- 
Dirk Schenkewitz 

InterFace AG                 fon: +49 (0)89 / 610 49 - 126
Leipziger Str. 16            fax: +49 (0)89 / 610 49 - 83
D-82008 Unterhaching         
http://www.interface-ag.de   mailto:dirk.schenkewitz@interface-ag.de
