From: "Yura Umanets" <umanets@priocom.com>
Subject: Re: Re: about crash
Date: Thu, 25 Apr 2002 20:39:32 +0300
Message-ID: <3CC83F54.3070804@priocom.com>
References: <3CC8173B.8030507@priocom.com> <1061290531.20020425170549@tnonline.net> <3CC81E0F.90000@priocom.com> <1672863140.20020425173202@tnonline.net> <3CC82770.4050607@priocom.com> <1294772062.20020425180352@tnonline.net> <3CC82C0B.7030604@priocom.com> <888141406.20020425190001@tnonline.net> <3CC8377F.6010400@priocom.com> <918425062.20020425190444@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10177-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

I've checked your lost+found dir. And I think it contains "." and ".." 
entries.

This is some part of output ./progsreiserfs-0.3.0/demos/ls 
/dev/Server/FTPRoot /lost+found

[root@server demos]# ./ls /dev/Server/FTPRoot /lost+found
.
..
42555_11634
42555_16819
42555_23482
42555_24549
42555_25089
42555_30440
42555_42703
42555_42710
42555_46086
42555_46088
42555_46090
42555_48062
42555_48119
42555_48135
42555_48848
42555_48851
32214_32216
18373_18376
20163_20164
20163_20167
20163_20168
19191_19192
19191_19193
28_29
29734_29735
29734_29736
29734_29737
29734_29738
29734_29739
29734_29740
29734_29741
29734_29742
25631_25632



