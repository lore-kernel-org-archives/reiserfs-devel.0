From: Jan Kara <jack@ucw.cz>
Subject: Re: Quota patches and  kinoded versions
Date: Fri, 1 Nov 2002 19:57:05 +0100
Message-ID: <20021101185705.GB12655@atrey.karlin.mff.cuni.cz>
References: <20021029201853.73380d45.philippe.gramoulle@mmania.com> <1035981874.8455.9.camel@tiny> <20021030161333.77b577f2.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11894-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021030161333.77b577f2.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe =?iso-8859-2?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

  Hello,
  
> On 30 Oct 2002 07:44:33 -0500
> Chris Mason <mason@suse.com> wrote:
> 
>   |  The kinoded-8 patch was updated to 2.4.19-pre7, but not changes were
>   |   made other than a simple merge.
> 
> Ok.
> 
>   |  
>   |   > 
>   |   > Also, do you plan to sync quota patches with 2.4.20pre or with 2.4.20 final once its out ?
>   |  
>   |   These won't fix the oops you posted yesterday.  I've got a patch in
>   |   testing here, I was hoping to reproduce the bug before sending it out
>   |   (instead of just guessing ;-)  I'll cleanup the debugging statements and
>   |   get you something worth using.
> 
> Unfortunately, we got another oops on another filer yesterday which seems to be because of the same
> bug ( ksymoops at the end)
> 
> The above statement leads me to think that this bug could still be hit even if i
> had 2.4.20-rc1 , right ?
> 
> On the same filer, i also found this in the logs: 
> 
> VFS: find_free_dqentry(): Data block full but it shouldn't.
> VFS: Error -5 occured while creating quota.
> VFS: find_free_dqentry(): Data block full but it shouldn't.
> VFS: Error -5 occured while creating quota.
> etc..
  This looks like corrupted quota file. Can you try running quotacheck?
  There was some race in quota code which caused exactly this messages
  but it should be fixed for a long time..

  								Honza
