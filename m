From: Linux Tard <linuxtard@yahoo.com>
Subject: Re: Trying to mount ReiserFS file system read only results in change
Date: Mon, 19 Dec 2005 06:24:10 -0800 (PST)
Message-ID: <20051219142410.65007.qmail@web34613.mail.mud.yahoo.com>
References: <43A66A6F.8060506@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-27441-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43A66A6F.8060506@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Hi Vladimir,

Thank you for reply.  Unfortunately in our testing the
journal count always is incremented (or we think that
is the change on the file system).  When we mount any
ReiserFS file system read only (ro) without
journalling (nolog) options and then unmount it, the
md5 value after unmount does not match the md5 value
before mount.  According to man page for mount the
'nolog' option is a work in progress, so we don't know
if this is why the count is still incremented or not?

We do know if we change that code in journal.c and
compile our kernel, the count is not incremented and
pre and post mounting authentication values are
equivalent.  We're trying to found out A) what is
being changed when mounted read only and B) why it's
being changed and ultimately C) is there something
else besides changing source code to stop this?

kind regards,
-lt


--- "Vladimir V. Saveliev" <vs@namesys.com> wrote:

> Hello
> 
> Linux Tard wrote:
> > Hi,
> > 
> > I'm trying to mount a ReiserFS file system read
> only
> > from a SATA drive.  Unfortunately the mount
> results in
> > a change to the file system (the journal count is
> > incremented?).  
> > 
> > Is there a way to mount a ReiserFS file system
> truly
> > read only, such that *no* changes occur (IE, the
> > authentication, MD5/SHA1 matches pre and post
> > mounting)?
> > 
> > Perhaps an undocumented mount option?  Or are we
> > forced to change the mount_id increment in the
> > journal.c code to '0'?  IF we change this code,
> how
> > dangerous is this?
> > 
> 
> I think you can avoid mount_id increment when there
> were no transactions
> replayed on mounting.
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
