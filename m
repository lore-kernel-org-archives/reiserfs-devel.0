From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: Tue, 29 Oct 2002 16:20:14 +0100
Message-ID: <20021029162014.0d9b359f.philippe.gramoulle@mmania.com>
References: <20021029155907.74f4b3ac.philippe.gramoulle@mmania.com>
	<20021029181438.A21904@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11823-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021029181438.A21904@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, mason@suse.com


FYI,

This in the log , before the oops :

 journal-1413: journal_mark_dirty: j_len (1024) is too big

and filer is low on space :o)

/dev/sdb1            572418604 572341220     77384 100% /storage

Should it be because filer hit 0 on space ?

Thanks,

philippe

On Tue, 29 Oct 2002 18:14:38 +0300
Oleg Drokin <green@namesys.com> wrote:

  |  Hello!
  |  
  |  On Tue, Oct 29, 2002 at 03:59:07PM +0100, Philippe Gramoull? wrote:
  |  
  |  > Is this still the infamous NFSD/inode race ?
  |  
  |  No.
  |  This is a bug in journalling code.
  |  Something related to improper transaction blocks accounting.
  |  Chris said he will try take care of it and rejected my 
  |  simple, but invalid patch.
  |  
  |  Chris, any news on that?
  |  
  |  > >>EIP; c0194899 <reiserfs_panic+29/60>   <=====
  |  > Trace; c01a1bcc <journal_mark_dirty+160/320>
  |  
  |  Bye,
  |      Oleg
  |  
