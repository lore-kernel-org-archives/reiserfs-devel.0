From: "Yura Umanets" <umanets@priocom.com>
Subject: Re: About crash ...
Date: Thu, 25 Apr 2002 16:39:14 +0300
Message-ID: <3CC80702.80402@priocom.com>
References: <3CC8012A.8020407@priocom.com> <2817083468.20020425151516@tnonline.net> <3CC80432.6090202@priocom.com> <10917933437.20020425152926@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10170-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Anders Widman wrote:
> With rootdir as the root (/) of the root filesystem, or as the root of
> this ReiserFS filesystem? =) I have mounted as read-only, as the
> system will hang if something is trying to change anything in the
> lost+found (as far as I know).

I mean can you read data from broken lost+found dir? If so, do it and 
save all from lost+found anywhere else.


