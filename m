From: Oleg Drokin <green@namesys.com>
Subject: Re: Problem with my HDD
Date: Fri, 31 May 2002 12:29:55 +0400
Message-ID: <20020531122955.A1995@namesys.com>
References: <Pine.LNX.4.44.0205300905050.22928-100000@avon.timetraveller.org> <390726734.20020530020909@tnonline.net> <20020530091729.C3922@namesys.com> <1022822148.334.18.camel@threshold>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10462-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1022822148.334.18.camel@threshold>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Billy Transue <bill@black9.net>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, May 31, 2002 at 12:15:48AM -0500, Billy Transue wrote:
 
> I've suffered a very similar problem and posted to the list earlier, I
> did, dd_resuce -l dd.log /dev/hdd5 ./hdd5 and winded up w/ this:
> dd_rescue: (info): ipos:         0.0k, opos:         0.0k,
> xferd:         0.0k
>                    errs:      0, errxfer:         0.0k,
> succxfer:         0.0k
>              +curr.rate:        0kB/s, avg.rate:        0kB/s,
> avg.load:  0.0%
> it never changed, the file created hdd5 was 65536 bytes large.  The log
> file was empty.  Am I doing something wrong?  Any info would be
> appreciated.  Thanks in advance.

I'd suggest you to write to Kurt Garloff, since this looks like a bug.

Bye,
    Oleg
