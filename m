From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Filesystem corruption
Date: Mon, 28 May 2007 16:23:17 +0400
Message-ID: <200705281623.18402.vs@namesys.com>
References: <46598532.5060505@lncsa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30657-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <46598532.5060505@lncsa.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Laurent CARON <lcaron@lncsa.com>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com

Hello

On Sunday 27 May 2007 17:18, Laurent CARON wrote:
> Hi,
> 
> A few days ago, one of my procmail suddenly receipes stopped to work.
> 
> I didn't care much since this only was for 1 or 2 mails.
> 
> Yesterday, i took time to dig it a bit further and looked at the
> filesystem on my mail server
> 
> Here is the output of ls -al in the Maildir where my mails are stored
> 
> total 1341
> drwx------   6 lcaron mail       256 2007-05-24 10:35 ./
> drwx------ 363 lcaron mail     12184 2007-05-25 21:52 ../
> -rw-r--r--   1 lcaron mail        17 2004-05-25 09:19 courierimapacl
> drwx------   2 lcaron mail        48 2004-05-25 09:20 courierimapkeywords/
> -rw-r--r--   1 lcaron lcaron  169365 2007-05-24 10:35 courierimapuiddb
> drwx------   2 lcaron mail   1185016 2007-05-24 10:26 cur/
> -rw-------   1 lcaron mail         0 2004-05-25 09:19 maildirfolder
> ?---------   ? ?      ?            ?                ? new
> drwx------   2 lcaron mail        48 2007-05-24 19:16 tmp/
> 
> 
> The entry that scares me is
> ?---------   ? ?      ?            ?                ? new
> 
> Seems to me it is a filesystem corruption.
> 
> Any other solution than rebuild-tree ?
> 

Did you try "rm -rf new"?


> Thanks
> 
> Laurent
> 
> 
> 
