From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Trying to mount ReiserFS file system read only results in change
Date: Mon, 19 Dec 2005 11:08:15 +0300
Message-ID: <43A66A6F.8060506@namesys.com>
References: <20051219003716.25457.qmail@web34605.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27434-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051219003716.25457.qmail@web34605.mail.mud.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Tard <linuxtard@yahoo.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Hello

Linux Tard wrote:
> Hi,
> 
> I'm trying to mount a ReiserFS file system read only
> from a SATA drive.  Unfortunately the mount results in
> a change to the file system (the journal count is
> incremented?).  
> 
> Is there a way to mount a ReiserFS file system truly
> read only, such that *no* changes occur (IE, the
> authentication, MD5/SHA1 matches pre and post
> mounting)?
> 
> Perhaps an undocumented mount option?  Or are we
> forced to change the mount_id increment in the
> journal.c code to '0'?  IF we change this code, how
> dangerous is this?
> 

I think you can avoid mount_id increment when there were no transactions
replayed on mounting.

