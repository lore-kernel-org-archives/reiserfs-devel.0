From: "Yura Umanets" <umanets@priocom.com>
Subject: Re: Re: about crash
Date: Thu, 25 Apr 2002 20:57:31 +0300
Message-ID: <3CC8438B.4090500@priocom.com>
References: <3CC8173B.8030507@priocom.com> <1061290531.20020425170549@tnonline.net> <3CC81E0F.90000@priocom.com> <1672863140.20020425173202@tnonline.net> <3CC82770.4050607@priocom.com> <1294772062.20020425180352@tnonline.net> <3CC82C0B.7030604@priocom.com> <888141406.20020425190001@tnonline.net> <3CC8377F.6010400@priocom.com> <918425062.20020425190444@tnonline.net> <3CC83F54.3070804@priocom.com> <310382968.20020425193723@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10178-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Anders Widman wrote:
> What do you think the problem is then? If I try to rename (mv) a
> folder (and perhaps files) from lost+found the kernel would crash.

Since "." and ".." entries actually exist. I don't know what is the 
problem. Possible direntry of lost+found directory isn't valid. mv 
command modify it by corresponding sys_call and oops.

