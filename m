From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: [PAID PRIORITY SUPPORT REQUEST] Quotas not fully working in
 2.4.21-pre5
Date: Sat, 5 Apr 2003 13:11:18 +0200
Message-ID: <20030405131118.215367f2.philippe.gramoulle@mmania.com>
References: <20030405024529.71d46842.philippe.gramoulle@mmania.com>
	<20030405114200.A984@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="Multipart_Sat__5_Apr_2003_13:11:18_+0200_090038d0"
Return-path: <reiserfs-list-return-13587-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030405114200.A984@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>, reiserfs-dev@namesys.com

--Multipart_Sat__5_Apr_2003_13:11:18_+0200_090038d0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


On Sat, 5 Apr 2003 11:42:00 +0400
Oleg Drokin <green@namesys.com> wrote:

  | Hello!
  | 
  | On Sat, Apr 05, 2003 at 02:45:29AM +0200, Philippe Gramoull? wrote:
  | 
  | > Object: Can't set quotas with 2.4.21-pre5
  | >  After we upgraded from 2.4.19-pre6 + quota patches , 2.4.21-pre5 + data-logging and quota
  | > patches, we can't set quotas anymore.
  | 
  | Have you enabled all the compatibility stuff in kernel config? (show the relevant part of .config please).

Well, i think so yes.

You'll find attached the .config.

  | Everything was worked for me last time I tried (at the time of creatign those patches).
  | I will do more tests now and see what will happen.
  | What quotatools version do you have?

quota is version 3.07-2 ( debian package )
quotatool is version 1.3.0-1 ( debian package )
  | 
  | > here is an extract from 2 straces:
  | > quotactl(Q_SETQLIM|GRPQUOTA, "/dev/sdb1", 502242, {2048, 0, 0, 0, 0, 0, 0, 0}) = -1 EINVAL (Invalid argument)
  | > quotactl(Q_SETQLIM|GRPQUOTA, "/dev/sdb1", 32066, {2048, 0, 0, 0, 0, 0, 0, 0}) = -1 EINVAL (Invalid argument)
  | > This problem is really nasty as this filer is used for the paying services and now clients can use as much
  | > space as they want.
  | 
  | So, you mean that even old quota limits that were set previously are not enforced?

Yes, exactly.

Thanks,

Philippe

--Multipart_Sat__5_Apr_2003_13:11:18_+0200_090038d0--
