From: Ookhoi <ookhoi@humilis.net>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 13:57:54 +0100
Message-ID: <20030228135754.G24291@humilis>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281439.24760.liviu.voicu@huji.ac.il> <20030228133836.D24291@humilis> <200302281448.20572.liviu.voicu@huji.ac.il> <3E5F5C64.7080408@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12994-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E5F5C64.7080408@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Voicu Liviu <liviu.voicu@huji.ac.il>, ookhoi@humilis.net, reiserfs-list@namesys.com

Hans Reiser wrote (ao):
> > PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
> > 889 portage   15 -10 21508  21M  4172 R <  98.9  8.4   0:16 cc1plus
> > 890 portage    5 -10  2368 2368   752 S <   0.9  0.9   0:00 as
> > 845 liviu     15   0  1100 1100   792 R     0.1  0.4   0:00 top
>
> Voicu, I think you have your nice directions confused, and you want to
> nice your compile to +10 not -10.  Probably Unix should reverse the
> directions, but....

I believe he wants to speed up the compile, for which -10 is ok if there
are other processes which need cpu cycles.
