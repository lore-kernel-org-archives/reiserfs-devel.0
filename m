From: Anders Widman <andewid@tnonline.net>
Subject: Re: Unicode policy
Date: Fri, 2 May 2003 12:51:54 +0200
Message-ID: <795694256.20030502125154@tnonline.net>
References: <200305011538.h41FcFn01653@linux1.futureware.at>
 <20030501154819.GA15670@namesys.com> <3EB1C209.1050808@namesys.com>
 <200305020118.h421Ip205033@linux1.futureware.at> <3EB24C31.6030401@namesys.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13931-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EB24C31.6030401@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>>
>>UTF-8 (is also Unicode) has no nulls in it, and does not 
>>generate '/' or other problematic charakters, and is actually working on 
>>Reiserfs.
>>
> Well, in that case, everything is done, VFS is fine as is, just start 
> using UTF-8.  I am not sure who decides how to render UTF-8, but that 
> would presumably be outside the kernel.

It  is  up  to  the application to treat the names as they whish.. For
example  bash,  mc  and  gnome programs treat differently. At least in
most  Gnome  2 programs UTF-8 works mostly :) However I do not know if
UTF-16/32 works.


--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

