From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: NFS issues with reiserfs 3.6? ext3 works...
Date: Fri, 26 Mar 2004 18:33:44 +0300
Message-ID: <1080315224.5920.17.camel@tribesman.namesys.com>
References: <20040326115302.GD1315@mathematik.uni-bielefeld.de>
	 <1080307106.5920.1.camel@tribesman.namesys.com>
	 <1080308538.2822.95.camel@watt.suse.com>
	 <20040326140939.GH1315@mathematik.uni-bielefeld.de>
	 <1080310685.2820.104.camel@watt.suse.com>
	 <20040326142015.GI1315@mathematik.uni-bielefeld.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17500-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040326142015.GI1315@mathematik.uni-bielefeld.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Sadlowski <sadlowsk@mathematik.uni-bielefeld.de>, Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

On Fri, 2004-03-26 at 17:20, Bernhard Sadlowski wrote:
> On 26 Mar 2004 09:18, Chris Mason <mason@suse.com> wrote:
> > > I did compile both kernels myself from original kernel.org source. 
> > > 
> > Thanks for the clarification.  Running dt under strace as Vladimir
> > suggested will help.
> 
> I did send him the output by private mail, because the list doesn't
> accept bigger attachments. If you are interested, I can send you the
> strace output too.
> 
> Bernhard
> 

I looked at straces you sent. The substantial differences start after
sendto() I quote below. If in both cases 'dt mkdir' tries to create a
directory on nfs mounted directory - then why does reiserfs send
something to 127.0.0.1 whereas ext3 sends to 145.228.118.41?

reiserfs:
getpid()                                = 27812
sendto(5, "\\\252\1H\0\0\0\0\0\0\0\2\0\4\224\345\0\0\0\2\0\0\0\1\0"...,
84, 0, {sa_family=AF_INET, sin_port=htons(892),
sin_addr=inet_addr("127.0.0.1")}, 16) = 84

ext3:
getpid()                                = 27652
sendto(5, "RM\347\254\0\0\0\0\0\0\0\2\0\4\224\345\0\0\0\2\0\0\0\1"...,
68, 0, {sa_family=AF_INET, sin_port=htons(687),
sin_addr=inet_addr("145.228.118.41")}, 16) = 68




