From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [ANNOUNCE] Reiserfs/kill-bkl tree v2
Date: Sun, 02 Aug 2009 22:04:40 -0700
Message-ID: <adatz0po5cn.fsf@cisco.com>
References: <20090731174642.GA6539@nowhere>
	<20090801081141.GA18036@basil.fritz.box>
	<20090801155335.GA4836@nowhere> <20090802142100.GA21160@elte.hu>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090802142100.GA21160@elte.hu> (Ingo Molnar's message of "Sun,
	2 Aug 2009 16:21:00 +0200")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=1240; t=1249275881; x=1250139881;
	c=relaxed/simple; s=sjdkim4002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=rdreier@cisco.com;
	z=From:=20Roland=20Dreier=20<rdreier@cisco.com>
	|Subject:=20Re=3A=20[ANNOUNCE]=20Reiserfs/kill-bkl=20tree=2
	0v2
	|Sender:=20;
	bh=z6tVYfj6Yd8SFrSaI6lWPZ8TgPkdCrPLYmYEq6IR+qA=;
	b=BImEnqUItFSNPThrZFOMF4/NbCxfz/mduM7nE9Hh4Hef2eT8ITTDr4v5oJ
	zRgVn83ViCVLaL07nAYVZNB7tRmnmr1WXM4brLEvGKof/h2xzSw81q4TaK5C
	e1/KHKqrIj;
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Andi Kleen <andi@firstfloor.org>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>


 > Well, dont waste too much time on it (beyond the due diligence 
 > level) - Andi forgot that the right way to stress-test patches is to 
 > get through the review process and then through the integration 
 > trees which have far more test exposure than any single contributor 
 > can test.
 > 
 > Patch submitters cannot possibly test every crazy possibility that 
 > is out there - nor should they: it just doesnt scale. What we expect 
 > people to do is to write clean patches, to test the bits on their 
 > own boxes and submit them to lkml and address specific review 
 > feedback.

I respectfully disagree in this case.  For patches that touch, say,
something hardware dependent where the patch submitter doesn't have all
the variations on the hardware, yes, I agree, scale the testing by
running the code on many machines.  But for the code in question, where
some very fundamental and complex changes are being made to filesystem
locking, I don't think that testing really scales -- after all, if there
is some race then it's quite likely that testers will just see some rare
filesystem corruption, which could easily waste weeks of debugging
before the BKL/reiserfs patches were even implicated.

 - R.
