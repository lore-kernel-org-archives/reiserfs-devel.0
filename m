From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: linux and nfs issues
Date: Thu, 29 Jan 2004 13:05:17 +0100
Message-ID: <20040129130517.61e26e31@philou.gramoulle.local>
References: <1075376569.633.166.camel@manson.ednet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16649-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1075376569.633.166.camel@manson.ednet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello Robert,

Well, you don't tell if this is a problem for you.
Is the server working fine though ?

As the log say, you can safely ignore this.

We have this warning logged for months, and everything's been working fine here.

Thanks,

Philippe

On Thu, 29 Jan 2004 11:42:49 +0000
Robert Lazzurs <rob@ednetisp.net> wrote:

  | We have noticed some serious issues with out linux based nfs server with
  | a reiser 3.6 partition on raid 1.  From the logs it appears like a nfs
  | locking issue.
  | 
  | Jan 19 11:25:29 liszt-06/liszt-06 kernel: vs-13075:
  | reiserfs_read_inode2: dead inode read from disk [30626 747337 0x0 SD].
  | This is likely to be race with knfsd. Ignore
